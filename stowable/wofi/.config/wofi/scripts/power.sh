#!/bin/bash

entries="󰐥 Shutdown\n󰜉 Reboot\n󰒲 Suspend\n󰍁 Lock\n󰍃 Logout"

selected=$(echo -e $entries | wofi --show dmenu -i --lines=7 --width=20% --hide-scroll --cache-file=/dev/null --prompt="Power Options" | awk '{print tolower($2)}')

case $selected in
shutdown)
  exec systemctl poweroff -i
  ;;
reboot)
  exec systemctl reboot
  ;;
suspend)
  swaylock -c 282828 &
  exec systemctl suspend
  ;;
lock)
  exec swaylock -c 282828
  ;;
logout)
  exec loginctl terminate-session $XDG_SESSION_ID
  ;;
esac
