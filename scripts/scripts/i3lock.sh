#!/usr/bin/env bash

icon="$HOME/scripts/lock_2.png"
tmpbg='/tmp/lock/screen.png'
scale=2
mapfile -t displays < <( xrandr | grep -w connected  | sed 's/primary //' | awk -F'[ +]' '{print $3,$4}' )

(( $# )) && { icon=$1; }

iconcenterx=$(convert $icon -format \"%[fx:w/2/$scale]\" info:)
iconcentery=$(convert $icon -format \"%[fx:h/2/$scale]\" info:)
iconcenterx=${iconcenterx//\"}
iconcentery=${iconcentery//\"}
#echo "$iconcenterx"
#echo "$iconcentery"

mkdir -p /tmp/lock

# scrot "$tmpbg"
maim > "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
#convert "$tmpbg" -scale 10% -scale 1000% \( "$icon" -scale $((100/$scale))% -gravity center \) -composite -matte "$tmpbg"

for i in "${displays[@]}"; do
    read res offset <<< "$i"
    IFS="x" read x y <<< "$res"
    #geox=$(($offset+$x/2-$iconcenterx))
    geox=$(echo "$offset+$x/2-$iconcenterx" | bc )
    geoy=$(echo "$y/2-$iconcentery" | bc )

    convert "$tmpbg" \( "$icon" -scale 50% -geometry "+$geox+$geoy" \) -composite -matte "$tmpbg"
done

i3lock -e -f -c 000000 -i "$tmpbg"
