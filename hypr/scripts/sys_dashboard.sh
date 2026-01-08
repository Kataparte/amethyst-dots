#!/bin/bash

# 1. Switch to Workspace 9
hyprctl dispatch workspace 9

# 2. Launch Btop (Left)
hyprctl dispatch exec [workspace 9] "kitty --class sys_btop -e btop"

sleep 0.2

# 3. Launch Fastfetch (Top Right)
hyprctl dispatch exec [workspace 9] "kitty --class sys_fetch -e sh -c 'fastfetch; read'"

# 4. Launch Cava (Bottom Right)
hyprctl dispatch exec [workspace 9] "kitty --class sys_visual -e cava"
