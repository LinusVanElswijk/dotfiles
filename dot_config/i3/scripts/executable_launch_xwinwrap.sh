#!/bin/bash

STATE_DIR="$HOME/.local/state/ambi3nce"
mkdir -p "$STATE_DIR"
SOCK_FILE="$STATE_DIR/mpv_socks"

VIDEO_FILE=$(realpath "$STATE_DIR/current_wallpaper" 2>/dev/null)

# Fallback to first video in hardcoded folder if current_wallpaper doesn't exist
if [ ! -e "$VIDEO_FILE" ]; then
  VIDEO_FILE=$(find "$HOME/.local/share/backgrounds" -type f -name '*.mp4' | head -n1)
  ln -sf "$VIDEO_FILE" "$STATE_DIR/current_wallpaper"
fi

# Clear previous sockets file
echo "" > "$SOCK_FILE"
rm "$HOME/.local/state/ambi3nce/mpv_wall_*.sock"

all_monitors="$(xrandr --listactivemonitors | awk '/^[ 0-9]+:/ {split($3,a,"[x/+]+"); print a[1], a[3], a[5], a[6]}')"

killall --wait xwinwrap

INDEX=0
SOCKS=()

while IFS= read -r monitor; do
    monitor=($monitor)  # convert string to array of words
    width=${monitor[0]}
    height=${monitor[1]}
    offset_x=${monitor[2]}
    offset_y=${monitor[3]}
    geometry="${width}x${height}+${offset_x}+${offset_y}"

    SOCK="$STATE_DIR/mpv_wall_$INDEX.sock"
    SOCKS+=("$SOCK")

    AUDIO_ARGS="--no-audio"
    [ $INDEX -eq 0 ] && AUDIO_ARGS=""

    xwinwrap -ov -g "$geometry" -- \
      mpv -wid WID "$VIDEO_FILE" \
        --no-osc\
        --no-osd-bar\
        --speed=1.0\
        --loop-file\
        --player-operation-mode=cplayer\
        --mute=yes\
        $AUDIO_ARGS\
        --input-ipc-server="$SOCK"\
        --panscan=1.0\
        --keepaspect\
        --no-input-default-bindings\
        --hwdec &

    INDEX=$((INDEX+1))
done <<< "$all_monitors"

printf "%s\n" "${SOCKS[@]}" > "$SOCK_FILE"

