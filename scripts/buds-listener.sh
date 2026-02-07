#!/bin/bash
MAC="28:3D:C2:4A:87:4F"
STATE_FILE="/tmp/buds_connected"

while true; do
    # Check if the Buds are connected
    if bluetoothctl info "$MAC" | grep -q "Connected: yes"; then
        # If they just connected (state file doesn't exist yet)
        if [ ! -f "$STATE_FILE" ]; then
            notify-send "Buds2 Pro" "✅ Connected to Laptop" -i bluetooth -a "System" -t 3000
            touch "$STATE_FILE"
        fi
    else
        # If they are disconnected, remove the state file so we can notify next time
        rm -f "$STATE_FILE"
    fi
    sleep 2
done
