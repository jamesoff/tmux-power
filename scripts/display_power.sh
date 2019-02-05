#!/usr/bin/env bash

if [[ $(uname) != 'Darwin' ]]; then
	# currently only supports macOS
	exit 0
fi

tmux_session=$( tmux display-message -p '#S' )
if [[ $tmux_session != 'fullscreen' && $tmux_session != 'remote' ]]; then
	exit 0
fi

power_info=$( pmset -g batt | grep InternalBattery | tail -n 1 )

if [[ -z $power_info ]]; then
	exit 0
fi

# -InternalBattery-0 (id=5046371)        41%; charging; 2:38 remaining present: true
#-InternalBattery-0 (id=5046371)        42%; discharging; (no estimate) present: true
state="$( echo -n "$power_info" | cut -d\; -f2 | tr -d ' ' )"
percent="$( echo -n "$power_info" | cut -d\; -f1 | cut -f2 | tr -d '%' )"

if [[ $percent -lt 30 ]]; then
	battery_colour='196'
	battery_icon=' '
elif [[ $percent -lt 70 ]]; then
	battery_colour='226'
	battery_icon=' '
else
	battery_colour='70'
	battery_icon=' '
fi

if [[ $state == "charging" ]]; then
	battery_colour='31'
fi

if [[ $percent -eq 100 && $state == "charged" ]]; then
	battery_icon=''
fi

if [[ $state == "discharging" && $percent -lt 30 ]]; then
	remaining="$( echo -n "$power_info" | cut -d\; -f3 | cut -f2 -d " " )"
	if [[ $remaining == "(no" ]]; then
		remaining=""
	else
		remaining=" $remaining"
	fi
fi

echo "#[fg=colour$battery_colour]$battery_icon$remaining"
