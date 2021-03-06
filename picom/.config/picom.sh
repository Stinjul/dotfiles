#!/usr/bin/env bash

# Terminate already running bar instances
killall -q picom

# Wait until the processes have been shut down
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done

# Launch
picom --config ~/.config/picom.conf --experimental-backends &
#picom --config ~/.config/picom.conf &
#picom --config ~/.config/picom.conf --force-win-blend --glx-fshader-win "$(< ~/.config/gw2taco-fix.glsl)" &
#picom --config ~/.config/picom.conf --experimental-backends --glx-fshader-win "$(< ~/.config/gw2taco-fix.glsl)" &
