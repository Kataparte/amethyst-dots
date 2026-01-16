# 🌌 Amethyst-Dots

A streamlined, Matugen-driven Hyprland configuration. This setup focuses on aesthetic consistency, automated color-theming, and a high-performance "Gallery" experience.

---

## 🛠️ System Overview
* **OS:** Arch Linux 🐧
* **WM:** Hyprland
* **Bar:** Waybar (Dynamic Amethyst modules)
* **Theme Engine:** [Matugen](https://github.com/InioX/matugen)
* **Notifications/Control Center:** SwayNC
* **Launcher/Picker:** Rofi-Wayland
* **Terminal:** Kitty
* **Shell:** Bash (with custom `dots` sync script)

---

## ✨ New: Amethyst Wall-Picker
The highlight of this build is a custom-engineered Wallpaper Picker:
* **Instant Previews:** Uses ImageMagick to cache thumbnails for zero-lag browsing.
* **Dynamic Sync:** Selecting a wall automatically triggers Matugen to re-theme the entire system (Waybar, Kitty, Rofi, and SwayNC).
* **Drop-Down UI:** Perfectly anchored beneath the Waybar "Amethyst" module for a native OS feel.

---

## 📦 Dependencies

### **Core Desktop Environment**
| Category | Packages |
| :--- | :--- |
| **Window Manager** | `hyprland`, `hyprpaper`, `hypridle`, `hyprlock` |
| **UI Components** | `waybar`, `swaync`, `rofi-wayland`, `wlogout` |
| **Theming** | `matugen-bin`, `nwg-look`, `imagemagick` |
| **AUR Extras** | `ags` (Optional), `hyprsunset` |

### **Apps & Utilities**
* **Terminal:** `kitty`
* **File Manager:** `thunar`
* **System Info:** `btop`, `fastfetch`
* **Audio/Visual:** `cava`, `playerctl`, `pavucontrol`

---

## 📂 Repository Structure
- `hypr/`: Core window manager logic and keybindings.
- `waybar/`: Top bar configuration with dynamic color imports.
- `rofi/`: Themed application launcher and the **Amethyst Gallery**.
- `scripts/`: Home of `wall-picker` and the `dots` sync utility.
- `swaync/`: Notification daemon and Control Center CSS.
- `matugen/`: Material You templates for system-wide colors.
- `cava/`: Audio visualizer synced to the system palette.

---

## 📥 Installation

1. **Clone the repo:**
   ```bash
   git clone [https://github.com/Kataparte/amethyst-dots.git](https://github.com/Kataparte/amethyst-dots.git) ~/amethyst-dots
