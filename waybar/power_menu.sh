#!/bin/bash

options="󰓅 Performance\n󰾅 Balanced\n󰾆 Power Saver"

chosen="$(echo -e "$options" | rofi -dmenu -p "" \
    -theme-str 'window { 
        width: 15%; 
        height: 0;           /* IMPORTANT: This overrides your global 45% height */
        location: north east; 
        anchor: north east; 
        x-offset: -0.5%;     /* Adjust this to move Left/Right */
        y-offset: 1%;      /* Adjust this to move Up/Down */
    }' \
    -theme-str 'listview { 
        lines: 3; 
        fixed-height: false; /* Forces the box to shrink to fit only 3 lines */
    }' \
    -theme-str 'mainbox { children: [ listview ]; }')"

case $chosen in
    *Performance) powerprofilesctl set performance ;;
    *Balanced) powerprofilesctl set balanced ;;
    *Power\ Saver) powerprofilesctl set power-saver ;;
esac
