#!/usr/bin/env bash

icon="$HOME/scripts/lock_2.png"
tmpbg='/tmp/lock/screen.png'

(( $# )) && { icon=$1; }

mkdir -p /tmp/lock

scrot "$tmpbg"
#convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% \( "$icon" -scale 50% -gravity center \) -composite -matte "$tmpbg"

i3lock -e -f -c 000000 -i "$tmpbg"
