#!/bin/sh

wifi="$(iwctl station wlan0 show | grep -i "connected network" | xargs | sed -e "s/^Connected network //")"
batcap=$(cat /sys/class/power_supply/BAT0/capacity)
date=$(date +'%d.%m.%Y %H:%M')

volume=$(pacmd list-sinks | grep -A 15 '* index' | awk '/volume: front/{ print $5 }' | sed 's/[%|,]//g')
muted=$( pacmd list-sinks | grep -A 15 '* index' | awk '/muted:/{ print $2 }')
[ $muted = yes ] && volume="MUTED"

echo "WIFI:${wifi}  BAT:${batcap}  VOL:${volume}  ${date} "