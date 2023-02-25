#!/bin/bash

entries="󰐥 Shutdown\n󰜉 Reboot\n󰍃 Logout\n󰉉 Hibernate\n󰒲 Suspend\n󰍁 Lock"

selected=$(echo -e $entries | wofi --show dmenu -i --lines=8 --width=15% --hide-scroll --cache-file=/dev/null --prompt="Power Options" | awk '{print tolower($2)}')

case $selected in
shutdown)
  exec systemctl poweroff -i
  ;;
hibernate)
  exec systemctl hibernate
  ;;
suspend)
  exec systemctl suspend
  ;;
reboot)
  exec systemctl reboot
  ;;
logout)
  exec loginctl terminate-session $XDG_SESSION_ID
  ;;
lock)
  exec swaylock -i $HOME/pics/wall.jpg
  ;;
esac
