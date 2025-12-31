#!/bin/bash

# Check if the dashboard is already running
if pgrep -f "dash_btop" > /dev/null; then
    # If it is, kill all three
    pkill -f "dash_btop"
    pkill -f "dash_fastfetch"
    pkill -f "dash_matrix"
else
    # If not, launch them
    # --logo-padding 3 and --logo-type small helps it fit in small tiles
    kitty --title "dash_btop" btop &
    sleep 0.2
    
    # We use --logo-type small to prevent it from cutting off
    #kitty --title "dash_fastfetch" sh -c "fastfetch --logo-type small; read" &
    kitty --title "dash_fastfetch" -o window_padding_width=20 sh -c "fastfetch -c dashboard.jsonc; read -p ''" &
    sleep 0.2
    
    kitty --title "dash_matrix" cmatrix -C magenta &
fi
