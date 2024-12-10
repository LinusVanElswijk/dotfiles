#!/bin/bash

touchpad_id=$(xinput list | grep Touchpad | cut -f2 -d= | cut -f1)
prop_id_natural_scrolling=326
xinput set-prop "$touchpad_id" "$prop_id_natural_scrolling" 1
