#!/bin/env bash

export WINEPREFIX="${HOME}/Documents/Lutris_SSD_Games/guild-wars-2/"
export WINEESYNC=1
export WINEDLLOVERRIDES="dcomp="

TacO_folder="${WINEPREFIX}drive_c/users/stinjul/GW2TacO_047r/"

wine64 start /unix "${TacO_folder}GW2TacO.exe"
sleep 8

GW2_window=$(xdotool search --name '^Guild Wars 2$')
TacO_window=$(xdotool search --name '^Guild Wars 2 Tactical Overlay$')

echo "picom-trans -w ${TacO_window} 99"
picom-trans -w "${TacO_window}" 99
echo "xdotool behave ${TacO_window} focus windowfocus ${GW2_window}"
xdotool behave ${TacO_window} focus windowfocus ${GW2_window}
