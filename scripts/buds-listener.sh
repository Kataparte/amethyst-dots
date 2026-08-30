#!/bin/bash
MAC="28:3D:C2:4A:87:4F"
STATE_FILE="/tmp/buds_connected"

# Ensure the bluetooth service is actually powered on first
bluetoothctl power on

while true; do
    # Check current connection status
    INFO=$(bluetoothctl info "$MAC")
    
    if echo "$INFO" | grep -q "Connected: yes"; then
        # If connected and we haven't notified yet
        if [ ! -f "$STATE_FILE" ]; then
            notify-send "Buds2 Pro" "✅ Connected" -i audio-headphones -a "System" -t 3000
            touch "$STATE_FILE"
        fi
    else
        # Not connected. Check if the device is "Paired" and within range
        # If it's paired but not connected, try to force a connection
        if echo "$INFO" | grep -q "Paired: yes"; then
             # Try to connect, but don't spam it (only try every 10 seconds if disconnected)
             bluetoothctl connect "$MAC" > /dev/null 2>&1
        fi
        
        rm -f "$STATE_FILE"
    fi
    
    sleep 5 # Check every 5 seconds to save battery/CPU
done
