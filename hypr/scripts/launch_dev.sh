#!/bin/bash
# 1. Start live-server in a kitty window with a unique class
kitty --class live-server-bg -e live-server --browser=google-chrome-stable &

# 2. Wait 0.5 seconds for the window to actually exist
sleep 0.5

# 3. Manually move that specific window to Workspace 9
hyprctl dispatch movetoworkspacesilent 9,class:live-server-bg
