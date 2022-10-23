#!/bin/env bash

ACTIVE_NOTIFS=$(dunstctl count displayed)

if [[ $ACTIVE_NOTIFS > 0 ]]; then
    dunstctl "$1"
    echo "eer"
else
#    pkill -USR2 -x sxhkd
    #notify-send "$2"
    #xdotool key $2
    ydotool key "$2"
    echo "ree"
#    pkill -USR2 -x sxhkd
fi
