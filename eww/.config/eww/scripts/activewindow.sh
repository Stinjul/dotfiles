#!/usr/bin/env bash

hyprctl activewindow -j | jq -c -M
  
socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | rg --line-buffered "window>>" | while read -r line; do
    hyprctl activewindow -j | jq -c -M
done
