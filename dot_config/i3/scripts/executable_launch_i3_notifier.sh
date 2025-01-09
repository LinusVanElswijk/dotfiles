#!/bin/bash

if command -v i3-notifier >/dev/null 2>&1; then
  killall --wait dunst
  i3-notifier
fi

