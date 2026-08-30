#!/bin/bash

WALL_DIR="/home/kataparte/Pictures/wallpapers"
CACHE_DIR="$HOME/.cache/wall-thumbs"
mkdir -p "$CACHE_DIR"

# 1. Generate Thumbnails (fast)
for img in "$WALL_DIR"/*.{jpg,png,webp,jpeg}; do
    [ -e "$img" ] || continue
    filename=$(basename "$img")
    if [ ! -f "$CACHE_DIR/$filename" ]; then
        magick "$img" -thumbnail 300x300 "$CACHE_DIR/$filename"
    fi
done

# 2. The Data Feed
gen_list() {
    for img in "$WALL_DIR"/*.{jpg,png,webp,jpeg}; do
        [ -e "$img" ] || continue
        filename=$(basename "$img")
        echo -en "$filename\0icon\x1f$CACHE_DIR/$filename\n"
    done
}

# 3. The UI (The version that worked)
# ... (Keep the gen_list part the same)

    CHOICE=$(gen_list | rofi -dmenu -i -p "󰸉" \
    -show-icons \
    -theme-str '
    configuration { 
        show-icons: true; 
    }
    window { 
        width: 650px;
        height: 230px;        /* We are forcing a small height now */
        location: center; 
        anchor: center; 
        border: 2px; 
        border-color: #7aa2f7; 
        border-radius: 12px;
        background-color: #1e1e2e;
    }
    mainbox { 
        children: [ listview ]; 
        padding: 0px;         /* Remove mainbox padding */
    }
    listview { 
        columns: 3; 
        lines: 1;
        spacing: 10px;
        padding: 15px;
        fixed-columns: true; 
        fixed-height: true;   /* Prevents the box from growing */
        scrollbar: false;
    }
    element { 
        orientation: vertical; 
        padding: 5px;
        border-radius: 8px;
    }
    element-icon { 
        size: 160px;          /* Tighter images */
        horizontal-align: 0.5; 
        vertical-align: 0.5;
    }
    element-text { 
        enabled: false; 
    }
    ')

# 4. Handle selection
if [ -n "$CHOICE" ]; then
    FULL_PATH="$WALL_DIR/$CHOICE"
    # Save the choice so it persists after reboot
    echo "$FULL_PATH" > "$HOME/.cache/current_wallpaper"
    # Apply the wallpaper and colors
    bash ~/.config/hypr/scripts/wall.sh "$FULL_PATH"
fi
