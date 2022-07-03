#!/bin/bash

entries="🔌 Shutdown\n↩️ Reboot\n🚪 Logout\n🔒 Lock"

selected=$(echo -e $entries | wofi --show dmenu -i --width=15% --lines=4 --hide-scroll --cache-file=/dev/null --prompt="Choose Power Options" | awk '{print tolower($2)}')

case $selected in
  shutdown)
    exec systemctl poweroff -i;;
  reboot)
    exec systemctl reboot;;
  logout)
    exec loginctl terminate-session $XDG_SESSION_ID;;
  lock)
    exec swaylock -i $HOME/pics/forest-hut.png;;
esac
