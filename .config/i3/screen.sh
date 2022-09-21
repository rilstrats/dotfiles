#!/bin/bash

if [[ ! -z $(polybar -m | grep eDP-1 ) ]]; then
  feh --bg-fill $HOME/.wallpapers/christ-calling-fishermen.3240x2160.jpeg 

elif [[ ! -z $(polybar -m | grep HDMI-0) && ! -z $(polybar -m | grep DP-4) ]]; then
  # xrandr --output eDP-1 --mode 1920x1200 --rate 60
  feh --bg-fill $HOME/.wallpapers/christ-calling-fishermen.2560x1080.jpeg --bg-fill $HOME/.wallpapers/christ-calling-fishermen.1920x1080.jpeg
fi

