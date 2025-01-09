#!/bin/sh

GLYPH_NORMAL=
GLYPH_URGENT=

# complete status format: uint32 <COUNT> uint32 <URGENCY>
COMPLETE_STATUS=$(dbus-send --session --print-reply=literal --dest=org.freedesktop.Notifications /org/freedesktop/Notifications org.freedesktop.Notifications.ShowNotificationCount | xargs || echo "0 0 0 0")
COUNT=$(echo "$COMPLETE_STATUS" | cut -d " " -f 2)
URGENCY=$(echo "$COMPLETE_STATUS" | cut -d " " -f 4)

if [ "$COUNT" -gt 0 ] && [ "$URGENCY" -gt 1 ]; then
  echo "$GLYPH_URGENT $COUNT"
  exit 0
fi

if [ "$COUNT" -gt 0 ] && [ "$URGENCY" -le 1 ]; then
  echo "$GLYPH_NORMAL $COUNT"
  exit 0
fi

echo ""
