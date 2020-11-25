#!/bin/bash
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        DEFAULT_NETWORK_IFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1) MONITOR=$m polybar --reload main &
    done
else
    DEFAULT_NETWORK_IFACE="wlan0" polybar main &
fi
