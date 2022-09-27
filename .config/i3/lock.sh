#!/bin/bash

if [[ ! -z $(xrandr | grep "eDP-1 connected") ]]; then
  i3lock -i $HOME/.wallpapers/christ-calling-fishermen.3240x2160.png

elif [[ ! -z $(xrandr | grep "HDMI-0 connected") && ! -z $(xrandr | grep "DP-4 connected") ]]; then
  i3lock-fancy
fi

