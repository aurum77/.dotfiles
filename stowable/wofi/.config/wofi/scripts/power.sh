#!/bin/bash

entries="󰐥 Shutdown\n󰜉 Reboot\n󰒲 Suspend\n󰍁 Lock\n󰍃 Logout"

selected=$(echo -e $entries | wofi --show dmenu -i --lines=7 --width=240 --hide-scroll --cache-file=/dev/null --prompt=" Choose a power option" | awk '{print tolower($2)}')

case $selected in
shutdown)
  exec systemctl poweroff -i
  ;;
reboot)
  exec systemctl reboot
  ;;
suspend)
  playerctl pause &
  swaylock &
  sleep 2 &&
    exec systemctl suspend
  ;;
lock)
  exec swaylock
  ;;
logout)
  exec loginctl terminate-session $XDG_SESSION_ID
  ;;
esac
