#!/bin/bash

RAW_LAYOUT=$(mmsg -k | cut -d' ' -f3)

case "${RAW_LAYOUT}" in
"us")
  echo "Qwerty"
  ;;
"eng")
  echo "Dvorak"
  ;;
*)
  echo "<Unknown>"
  ;;
esac
