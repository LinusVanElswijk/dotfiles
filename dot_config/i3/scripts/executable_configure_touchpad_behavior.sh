#!/bin/bash

touchpad_id=$(xinput list | grep Touchpad | cut -f2 -d= | cut -f1)
xinput set-prop "$touchpad_id" "libinput Natural Scrolling Enabled" 1

# disable click areas, enable finger count mapping
xinput set-prop "$touchpad_id" "libinput Click Method Enabled" 0 1
