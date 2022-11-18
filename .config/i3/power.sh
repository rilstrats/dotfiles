#!/usr/bin/bash

# timeout in minutes
DESKTOP_SCREEN=10
DESKTOP_SLEEP=20
LAPTOP_SCREEN=5
LAPTOP_SLEEP=10

pkill xautolock
pkill xss-lock

if [[ ! -z $(echo $HOST | grep laptop) ]]; then
  SCREEN=$(( LAPTOP_SCREEN * 60 )) # converted to seconds
  SLEEP=$LAPTOP_SLEEP
else
  SCREEN=$(( DESKTOP_SCREEN * 60 )) # converted to seconds
  SLEEP=$DESKTOP_SLEEP
fi

/usr/bin/xset dpms $SCREEN
/usr/bin/xautolock -time $SLEEP -locker "systemctl suspend" & disown
/usr/bin/xss-lock -- "$HOME/.config/i3/lock.sh" & disown

