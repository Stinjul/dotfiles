#!/usr/bin/env bash

rofi_cmd="rofi -theme ~/.cache/wal/colors-rofi-dark-menu.rasi"

mpc_playing="$(mpc | grep playing)"

op_prev=""
op_next=""
op_stop=""

if [ -n "$mpc_playing" ]; then
    op_toggle=""
else
    op_toggle=""
fi

options="$op_prev\n$op_toggle\n$op_stop\n$op_next"
width=$((13 + 4))

choice="$(echo -e "$options" | $rofi_cmd -dmenu -selected-row 1 -theme-str '#window{width : '$width'ch;}')"
case $choice in
    $op_prev)
        mpc prev
        ;;
    $op_toggle)
        mpc toggle
        ;;
    $op_stop)
        mpc stop
        ;;
    $op_next)
        mpc next
        ;;
esac
