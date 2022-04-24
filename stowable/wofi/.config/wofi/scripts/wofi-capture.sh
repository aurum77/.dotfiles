#!/bin/bash 

pid=`pgrep wf-recorder`
status=$?

if [ $status != 0 ]
then
  entries='📸 Capture screenshot\n📹 Capture video'
  lines=2
else
  entries='⏹️ Stop capturing'
  lines=1
fi

selected=$(echo -e $entries | wofi --show=dmenu --insensitive --width=25% --lines=$lines --hide-scroll --cache-file=/dev/null --prompt="Choose what to Capture" | awk '{print $3}')

case $selected in
  screenshot)
    exec grim -g "$(slurp -d)" - | wl-copy;;
  video)
    exec wf-recorder -g "$(slurp)" -a alsa_output.pci-0000_05_00.6.analog-stereo -f $(xdg-user-dir VIDEOS)/$(date +'recording_%Y-%m-%d-%H%M%S.mp4');;
  capturing)
    exec pkill --signal SIGINT wf-recorder;;
esac
