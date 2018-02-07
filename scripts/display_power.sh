#!/usr/bin/env bash

# Check if we're on the corp wifi
power_info=$( pmset -g batt | tail -n1 )

# -InternalBattery-0 (id=5046371)        41%; charging; 2:38 remaining present: true
#-InternalBattery-0 (id=5046371)        42%; discharging; (no estimate) present: true
state="$( echo "$power_info" | cut -d\; -f2 )"
percent="$( echo "$power_info" | cut -d\; -f1 | cut -f2 | tr -d '%' )"

if [[ $percent -lt 30 ]]; then
	battery_colour='196'
	battery_icon='  '
elif [[ $percent -lt 70 ]]; then
	battery_colour='226'
	battery_icon='  '
elif [[ $percent -lt 90 ]]; then
	battery_colour='22'
	battery_icon='  '
fi

if [[ $state == "charging" ]]; then
	battery_colour='31'
fi

echo "#[fg=$battery_colour]$battery_icon"
