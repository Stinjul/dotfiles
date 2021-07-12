#!/bin/env bash

export WINEPREFIX="${HOME}/Documents/Lutris_SSD_Games/guild-wars-2/"
export WINEESYNC=1

jokolink_folder="${WINEPREFIX}drive_c/jokolink/"

wine64 start /unix "${jokolink_folder}jokolink.exe"
