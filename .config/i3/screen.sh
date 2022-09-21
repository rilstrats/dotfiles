#!/bin/bash

if [[ ! -z $(xrandr | grep "eDP-1 connected") ]]; then
  feh --no-fehb \
    --bg-fill $HOME/.wallpapers/christ-calling-fishermen.3240x2160.jpeg 

elif [[ ! -z $(xrandr | grep "HDMI-0 connected") && ! -z $(xrandr | grep "DP-4 connected") ]]; then
  feh --no-fehb \
    --bg-fill $HOME/.wallpapers/christ-calling-fishermen.2560x1080.jpeg \
    --bg-fill $HOME/.wallpapers/christ-calling-fishermen.1920x1080.jpeg
fi

