#!/usr/bin/env bash
rofi_cmd="rofi -theme ~/.cache/wal/colors-rofi-dark.rasi"
player_cache="/tmp/$(basename -- "$0")_player"

function pick_player {
    player="$(echo "$(playerctl -l)" | $rofi_cmd -dmenu)"
    if [[ ! -z "$player" ]]; then
        echo $player > $player_cache
    fi
}

while getopts ":rc:" opt; do
    case "${opt}" in
        r)
            reset=1
            ;;
        c)
            player_cmd="$OPTARG"
            ;;
    esac
done


if [[ -f "$player_cache" ]] && [[ -z "$reset" ]]; then
    player=$(cat $player_cache)
    playerctl -p "$player" status > /dev/null
    if [[ $? -ne 0 ]]; then
        pick_player
    fi
else
    pick_player
fi

if [[ ! -z "$player" ]]; then
    ~/scripts/rofi/playerctl_runner.sh "$player" "$player_cmd"
fi
