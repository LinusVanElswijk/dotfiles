#!/bin/bash

kitty\
  --class keyboard-layout-float\
  --override background_opacity=1.0\
  --override tab_bar_min_tabs=2\
  --override confirm_os_window_close=0\
  --override font_size=16\
  -e ~/scripts/keyboard_layout_menu.sh

