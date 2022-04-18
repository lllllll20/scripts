#! /usr/bin/bash


if [[ ${HOSTNAME} = "desktop" ]]; then
    
    notify-send "Battery Status" "Mains power."
    
elif [[ ${HOSTNAME} = "laptop" ]]; then

    BAT0=$(cat /sys/class/power_supply/BAT0/capacity)

    BAT1=$(cat /sys/class/power_supply/BAT1/capacity)

    total=$((( BAT0 + BAT1 ) / 2 ))

    notify-send "Battery Status" "Total: $total\nBattery 1: $BAT0 \nBattery 2: $BAT1"

    exit

fi
