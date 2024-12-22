#!/bin/sh

GLYPH_OFF=󰂲
GLYPH_ON=󰂯
GLYPH_ACTIVE=󰂰


if [ "$(bluetoothctl show | grep -c 'Powered: yes')" -eq 0 ]; then
  echo $GLYPH_OFF
  exit 0
fi

NUM_CONNECTED_DEVICES="$(echo info | bluetoothctl | grep -c 'Connected: yes' )"
if [ "$NUM_CONNECTED_DEVICES" -eq 0 ]; then
  echo $GLYPH_ON

else
  echo $GLYPH_ACTIVE
fi

