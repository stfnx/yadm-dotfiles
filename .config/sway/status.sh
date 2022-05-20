#!/bin/sh

batcap=$(cat /sys/class/power_supply/BAT0/capacity)
date=$(date +'%d.%m.%Y %l:%M')

echo "BAT-${batcap}  ${date} "