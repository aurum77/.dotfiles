#!/bin/sh
# Usage
# $ ./weather.sh start
# $ ./weather.sh refresh

case $1 in
  start)
    sleep 10
    while true
    do
      weather=$(curl -X GET -s tr.wttr.in/?format=%C,+%t)
      echo ${weather} > /tmp/weather.cache
      sleep 3600
    done
    ;;
  refresh)
    weather=$(curl -X GET -s tr.wttr.in/?format=%C,+%t)
    echo ${weather} > /tmp/weather.cache
esac
