#!/usr/bin/env bash

rofi_cmd="rofi -theme ~/.cache/wal/colors-rofi-dark-menu.rasi"
playerctl_cmd="playerctl -p $1"

player_status="$($playerctl_cmd status | grep -i playing)"

op_prev=""
op_next=""
op_stop=""

if [ -n "$player_status" ]; then
    op_toggle=""
else
    op_toggle=""
fi

options="$op_prev\n$op_toggle\n$op_stop\n$op_next"
width=$((13 + 4))

if [[ ! -z "$2" ]]; then
    $playerctl_cmd $2
else
    choice="$(echo -e "$options" | $rofi_cmd -dmenu -selected-row 1 -theme-str '#window{width : '$width'ch;}')"
    case $choice in
        $op_prev)
            $playerctl_cmd previous
            ;;
        $op_toggle)
            $playerctl_cmd play-pause
            ;;
        $op_stop)
            $playerctl_cmd stop
            ;;
        $op_next)
            $playerctl_cmd next
            ;;
    esac
fi
