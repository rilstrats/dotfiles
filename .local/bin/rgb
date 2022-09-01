#!/bin/bash
sudo modprobe i2c-dev

if [[ -z $1 ]]; then
    read -p "Enter color code: " color
else
    color=$1
fi

openrgb -m static -c $color
