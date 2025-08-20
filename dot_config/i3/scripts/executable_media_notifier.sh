#!/bin/bash

last_song_file="/tmp/i3_media_notifier_current_song"
last_song=$(cat "$last_song_file" 2>/dev/null)

while sleep 2; do
    current_song=$(playerctl metadata --format "󰝚  {{ title }}\n  {{ album }}\n  {{ artist }}" 2>/dev/null)
    if [[ -n "$current_song" && "$current_song" != "$last_song" ]]; then
        title=$(echo -e "$current_song" | grep "󰝚 ")
        body=$(echo -e "$current_song" | grep -v "󰝚 ")
        notify-send --urgency=low --expire-time=10000 "${title}" "${body}" --app-name "i3" --hint=string:x-canonical-private-synchronous:nowplaying
    fi
    last_song=$current_song
    echo "$last_song" > $last_song_file
done

