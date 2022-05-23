#!/bin/sh

wifi="$(iwctl station wlan0 show | grep -i "connected network" | xargs | sed -e "s/^Connected network //")"
batcap=$(cat /sys/class/power_supply/BAT0/capacity)
date=$(date +'%d.%m.%Y %H:%M')

echo "WIFI:${wifi}  BAT:${batcap}  ${date} "