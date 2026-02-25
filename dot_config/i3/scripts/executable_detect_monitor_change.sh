#!/bin/bash

udevadm monitor --subsystem-match=drm --property | while read -r line; do
    if [[ "$line" =~ "change" ]]; then
        status=$(xrandr | awk '/ connected/ {print $1 " connected"} / disconnected/ {print $1 " disconnected"}')
        notify-send \
            --app-name="i3" \
            --urgency="low" \
            --expire-time=3000 \
            --hint=string:x-dunst-stack-tag:monitor \
            --action="Run Script:bash ~/.config/i3/scripts/redecorate_monitors.sh" \
            "Monitor Change" "$status"
    fi
done
