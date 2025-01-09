#!/bin/bash

IS_RUNNING=$(
  dbus-send --session\
            --print-reply\
            --dest=org.freedesktop.Notifications\
            /org/freedesktop/Notifications\
            org.freedesktop.Notifications.GetServerInformation\
  | grep -c dunst)

if [ "$IS_RUNNING" -eq 0 ]; then
  dunst &
fi
