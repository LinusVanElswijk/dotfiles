#!/bin/bash

# Get the focused application class name
focused_class=$(xdotool getwindowfocus getwindowclassname)

# Define specific application handling
case "$focused_class" in
    "firefox")
        # Send Ctrl+N to open a new window in Firefox
        xdotool key --clearmodifiers ctrl+n
        ;;
    "kitty")
        xdotool key --clearmodifiers shift+alt+ctrl+enter
        ;;
    *)
        # Generic fallback: open a new terminal
        i3-msg exec kitty
        ;;
esac

