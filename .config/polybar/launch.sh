#!/bin/bash
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
DEFAULT_NETWORK_IFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1) polybar main &
