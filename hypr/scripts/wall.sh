#!/bin/bash
echo "Targeting Image: $1" # This lets us see the path in the terminal
[ ! -f "$1" ] && echo "ERROR: File not found at $1" && exit 1

echo "$1" > "$HOME/.cache/current_wallpaper"

# 1. Start the AWww daemon if it isn't running
if ! pgrep -x "awww-daemon" > /dev/null; then
    awww-daemon &
    sleep 1
fi

# 2. Check for image
if [ -z "$1" ] || [ ! -f "$1" ]; then
    echo "Usage: wall.sh /path/to/image.png"
    exit 1
fi

# 3. Set the wallpaper
awww img "$1" --transition-type grow --transition-pos 0.85,0.97 --transition-step 90 --transition-fps 60

# 4. Run Matugen to generate colors
/home/kataparte/bin/matugen image "$1"

# 5. Force Waybar to restart so it sees the new colors.css
killall waybar
waybar > /dev/null 2>&1 &

echo "Wallpaper and colors updated!"
