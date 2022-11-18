#!/bin/bash

# kill previous bars
polybar-msg cmd quit
# killall -q polybar

# log
date >> /tmp/polybar.log

# loop through each monitor
for MONITOR in $(polybar -m | sed 's/:.*$//g'); do 
    export MONITOR

    if [[ $MONITOR == "eDP-1" ]]; then
      polybar laptop &>> /tmp/polybar.log & disown

    else
      polybar desktop &>> /tmp/polybar.log & disown
    fi

    sleep 0.5
done

unset MONITOR

