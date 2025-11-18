#!/bin/bash

# tear down
killall xwinwrap
killall polybar

# set up
autorandr --change 
~/.config/i3/scripts/launch_xwinwrap.sh &
~/.config/polybar/scripts/launch_polybar.sh

