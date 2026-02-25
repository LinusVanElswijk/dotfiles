#!/bin/bash

# tear down
killall xwinwrap
killall polybar

# set up
autorandr --change 
~/git/ambiflow/scripts/launch_xwinwrap.sh &
~/.config/polybar/scripts/launch_polybar.sh

