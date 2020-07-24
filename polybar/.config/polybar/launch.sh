#!/usr/bin/env bash
killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#MONITOR=$(polybar -m|tail -1|sed -e's/:.*$//g')
#polybar -l info example &

for m in $(polybar -m | cut -d":" -f1); do
    MONITOR=$m polybar --reload example &
done

echo "Polybar launched"
