#!/bin/bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
date >> /tmp/polybar.log
for monitor in $(polybar -m | sed 's/:.*$//g'); do 
    export MONITOR=$monitor
    polybar example &>> /tmp/polybar.log & disown
done

export MONITOR=""

echo "Bars launched..."
