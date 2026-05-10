#!/bin/bash

MONITOR="DP-1"

HDR_CONFIG="$MONITOR,2560x1440@239.76,1920x0,1,bitdepth,10,cm,hdr"
SDR_CONFIG="$MONITOR,2560x1440@239.76,1920x0,1"

STATE_FILE="/tmp/hypr-hdr-enabled"

if [ -f "$STATE_FILE" ]; then
    hyprctl keyword monitor "$SDR_CONFIG"
    rm "$STATE_FILE"
    notify-send "HDR Disabled"
else
    hyprctl keyword monitor "$HDR_CONFIG"
    touch "$STATE_FILE"
    notify-send "HDR Enabled"
fi