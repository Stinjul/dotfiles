#!/bin/sh
rofi -dmenu -no-fixed-num-lines -password -p "$(printf "$1" | sed s/://)"
