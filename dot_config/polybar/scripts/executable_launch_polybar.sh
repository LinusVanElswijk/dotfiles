#!/bin/bash

killall polybar
if type "xrandr"; then
  primary_monitor=$(xrandr --listactivemonitors | grep \* | cut -d" " -f6)

  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$m" = "$primary_monitor" ]; then
      MONITOR=$m polybar --reload main --config=~/.config/polybar/config.ini &
    else
      MONITOR=$m polybar --reload other --config=~/.config/polybar/config.ini &
    fi
  done
else
  polybar --reload main --config=~/.config/polybar/config.ini &
fi
