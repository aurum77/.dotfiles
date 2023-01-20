#!/bin/bash 

pid=`pgrep wf-recorder`
status_recorder=$?

if [[ $status_recorder == 0 ]];
then
  pkill --signal SIGINT wf-recorder
  exit
fi;

slurp=$(slurp)
status_slurp=$?

if [[ $status_slurp == 0 ]];
then 
  wf-recorder --geometry "$slurp" --force-yuv -f $(xdg-user-dir VIDEOS)/$(date +'recording_%Y-%m-%d-%H%M%S.mp4');
else
  exit
fi;
