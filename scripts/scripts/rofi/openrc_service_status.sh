#!/bin/bash

rofiCharWidth=52
escapeAction="break"

function rofi_command {
    # Width includes the scrollbar char(?), so +1
    rofi -theme ~/.cache/wal/colors-rofi-dark.rasi -dmenu -markup-rows -width -$(($rofiCharWidth+1)) "$@"
}

function sudo_command {
    sudo -A "$@"
}

function list_services {
    IFS=$'\n'
    declare -a servicesOut=()
    mapfile -t services < <(rc-status -s | awk '{print $1 " " $3}')

    for line in "${services[@]}"; do
        serviceName=$( echo "$line" | cut -d ' ' -f 1 )
        serviceStatus=$( echo "$line" | cut -d ' ' -f 2 )

        colpadding=$(($rofiCharWidth - ${#serviceStatus} - 2))
        case $serviceStatus in
            stopped|stopping|crashed|unsupervised)
                serviceStatus="[<span color='red'>$serviceStatus</span>]"
                ;;
            starting|inactive|scheduled|failed)
                serviceStatus="[<span color='yellow'>$serviceStatus</span>]"
                ;;
            started)
                serviceStatus="[<span color='green'>$serviceStatus</span>]"
                ;;
        esac

        servicesOut+=($(printf '%-*s%s\n' "$colpadding" "$serviceName" "$serviceStatus"))
    done

    echo "${servicesOut[*]}"
    unset IFS
}

function actions_menu {
    local actions=("start" "stop" "restart")
    local serviceName=$(echo $1 | cut -d' ' -f1)
    local runlevels="[$(get_runlevels $serviceName)]"
    local runlevelMessage=$(printf '%-*s%s\n' "$(($rofiCharWidth - ${#runlevels}))" "runlevels:" "$runlevels")

    local mesg=$(printf '%s\n%s' "$1" "$runlevelMessage")

    local action=$(printf "%s\n" "${actions[@]}" | rofi_command -mesg "$mesg" -p 'Select action')
    #if [ -z "$action" ]; then $escapeAction; fi

    case $action in
        start)
            sudo_command rc-service "$serviceName" start
            ;;
        stop)
            sudo_command rc-service "$serviceName" stop
            ;;
        restart)
            sudo_command rc-service "$serviceName" restart
            ;;
    esac
}

function get_runlevels {
    # Considered returning empty or something if it isnt in any runlevels,
    # But meh, doesn't really add anything IMO
    echo $(rc-update show -v | grep " $1 " | sed 's/  */ /g;s/.$//' | cut -d' ' -s -f4-)
}

while true; do
    service=$( list_services | rofi_command -p 'Select service' )
    if [ -z "$service" ]; then $escapeAction; fi

    actions_menu "$service"
done
