#!/usr/bin/env bash
#killall -q polybar
#
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
#
##MONITOR=$(polybar -m|tail -1|sed -e's/:.*$//g')
##polybar -l info example &
#
#for m in $(polybar -m | cut -d":" -f1); do
#    MONITOR=$m polybar --reload example &
#done
#
#echo "Polybar launched"

(
  flock 200

  killall -q polybar

  while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done

  outputs=$(xrandr --query | grep " connected" | cut -d" " -f1)
  tray_output=eDP1

  for m in $outputs; do
    if [[ $m == "DVI-D-0" ]]; then
        tray_output=$m
    fi
  done

  for m in $outputs; do
    export MONITOR=$m
    export TRAY_POSITION=none
    if [[ $m == $tray_output ]]; then
      TRAY_POSITION=right
    fi

    polybar --reload main </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
    disown
  done
) 200>/var/tmp/polybar-launch.lock
