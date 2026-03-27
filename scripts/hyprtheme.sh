#!/bin/bash
USER_NAME="kataparte"
WALL_DIR="/home/$USER_NAME/Pictures/wallpapers"
THEME_DIR_SYSTEM="/usr/share/hyprpanel/themes"
THEME_DIR_CUSTOM="/home/$USER_NAME/.cache/hyprpanel/themes"

# 1. Selection
SELECTED=$(ls $THEME_DIR_SYSTEM $THEME_DIR_CUSTOM 2>/dev/null | grep ".json" | sed 's/\.json//' | sort -u | rofi -dmenu -p "󰏘 Theme")
[ -z "$SELECTED" ] && exit 0

# 2. Apply Panel Theme
[ -f "$THEME_DIR_CUSTOM/$SELECTED.json" ] && hyprpanel useTheme "$THEME_DIR_CUSTOM/$SELECTED.json" || hyprpanel useTheme "$THEME_DIR_SYSTEM/$SELECTED.json"

# 3. Find Wallpaper
WP=$(find "$WALL_DIR" -maxdepth 1 -type f -iname "$SELECTED.*" | head -n 1)

# 4. Apply Wallpaper via setwall (to reuse the persistence logic)
if [ -n "$WP" ]; then
    ~/.local/bin/setwall "$WP"
    hyprpanel -p "$WP"
else
    notify-send "Theme Switcher" "No wallpaper found for $SELECTED"
fi
