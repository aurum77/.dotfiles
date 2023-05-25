#!/bin/bash

entries="󰒲 Suspend\n󰐥 Shutdown\n󰜉 Reboot\n󰍁 Lock\n󰍃 Logout"

selected=$(echo -e $entries | wofi --show dmenu -i --lines=7 --width=20% --hide-scroll --cache-file=/dev/null --prompt="Power Options" | awk '{print tolower($2)}')

case $selected in
suspend)
  swaylock -i $HOME/pics/wall.jpg &
  exec systemctl suspend
  ;;
shutdown)
  exec systemctl poweroff -i
  ;;
reboot)
  exec systemctl reboot
  ;;
lock)
  exec swaylock -i $HOME/pics/wall.jpg
  ;;
logout)
  exec loginctl terminate-session $XDG_SESSION_ID
  ;;
esac
