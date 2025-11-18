#!/bin/bash

udevadm monitor --subsystem-match=drm --property | while read -r line; do
    if [[ "$line" =~ "change" ]]; then
        ~/.config/i3/scripts/redecorate_monitors.sh
    fi
done
