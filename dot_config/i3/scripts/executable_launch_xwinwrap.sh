#!/bin/bash

# width height offset_x offset_y, per monitor
all_monitors="$(xrandr --listactivemonitors | awk '/^[ 0-9]+:/ {split($3,a,"[x/+]+"); print a[1], a[3], a[5], a[6]}')"

killall --wait xwinwrap

while IFS= read -r monitor; do
    monitor=($monitor)  # convert string to array of words
    width=${monitor[0]}
    height=${monitor[1]}
    offset_x=${monitor[2]}
    offset_y=${monitor[3]}
    geometry="${width}x${height}+${offset_x}+${offset_y}"

    xwinwrap -ov -g $geometry --\
      mpv -wid WID "$HOME/.local/share/backgrounds/winter-forest.1920x1080.mp4"\
        --no-osc\
        --no-osd-bar\
        --speed=1.0\
        --loop-file\
        --player-operation-mode=cplayer\
        --no-audio\
        --panscan=1.0\
        --keepaspect\
        --no-input-default-bindings\
        --hwdec &
done <<< "$all_monitors"

