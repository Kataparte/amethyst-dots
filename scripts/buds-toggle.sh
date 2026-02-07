#!/bin/bash
MAC="28:3D:C2:4A:87:4F"

# Check if connected
if bluetoothctl info "$MAC" | grep -q "Connected: yes"; then
    bluetoothctl disconnect "$MAC"
    notify-send "Buds Disconnected" "Audio returned to speakers" -i bluetooth-disabled -a "System"
else
    notify-send "Connecting Buds..." "Searching for Buds2 Pro..." -i bluetooth -a "System" -t 2000
    bluetoothctl connect "$MAC"
fi
