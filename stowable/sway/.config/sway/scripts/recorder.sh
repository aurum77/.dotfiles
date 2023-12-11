#!/bin/bash

pid=$(pgrep wf-recorder)
status_recorder=$?

if [[ $status_recorder == 0 ]]; then
  pkill --signal SIGINT wf-recorder
  exit
fi

slurp=$(slurp -b 282828aa -c 458588ff -d -F 'JetBrains Mono')
status_slurp=$?

if [[ $status_slurp == 0 ]]; then
  wf-recorder -x yuv420p --geometry "$slurp"  -a -f $(xdg-user-dir VIDEOS)/$(date +'recording_%Y-%m-%d-%H%M%S.mp4')
else
  exit
fi
