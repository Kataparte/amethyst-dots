# 🌌 Amethyst-Dots

A streamlined, **Matugen-driven** Hyprland configuration. This setup focuses on aesthetic consistency, automated color-theming, and a high-performance interactive experience.

> **Current Theme:** 🩵 Ranni Cyan / Aqua  
> **Status:** 🦉 Owl-Approved Terminal Environment

---

## 🛠️ System Overview
* **OS:** Arch Linux 🐧
* **WM:** [Hyprland](https://hyprland.org/)
* **Lock Screen:** [Hyprlock](https://wiki.hyprland.org/Hypr-ecosystem/hyprlock/) (Custom Bebop City layout)
* **Theme Engine:** [Matugen](https://github.com/InioX/matugen)
* **Interactive UI:** [AGS (Aylur's GTK Shell)](https://aur.archlinux.org/packages/ags)
* **Shell:** Bash + Starship + Zoxide
* **Development:** Neovim (LazyVim + CSC-120 Python Workspace)

---

## ✨ Build Highlights

### 🔒 Interactive Lock Screen
Custom-built **Hyprlock** interface featuring:
* Floating power icons (Shutdown, Reboot, Logout) centered with Pango-styled labels.
* Proportional Clock/Date display with "Bebop City" background integration.
* Subtle shadow-pops for high visibility against complex wallpapers.

### 🎨 Matugen DNA
This build is entirely dynamic. The `matugen/templates` folder contains the source code for:
* **Waybar** CSS & **SwayNC** colors.
* **Kitty** terminal themes & **Cava** visualizer bars.
* **Neovim** color palette exports.
* **Rofi** application launcher skins.

### 🐍 Python Workflow (CSC-120)
* **`py` Toggle:** A custom Bash function to instantly switch in/out of the virtual environment.
* **SnipRun:** Integrated into Neovim for instant code execution.

---

## 📦 Dependencies

This repository tracks all installed packages via:
* **`pkglist.txt`**: Official Arch repository packages.
* **`aurlist.txt`**: AUR-specific packages (Matugen, AGS, etc.).

### **Key Components**
| Category | Packages |
| :--- | :--- |
| **Window Manager** | `hyprland`, `hyprpaper`, `hypridle`, `hyprlock` |
| **UI Components** | `waybar`, `swaync`, `rofi-wayland`, `ags` |
| **Theming** | `matugen-bin`, `nwg-look`, `imagemagick` |
| **Utilities** | `eza`, `zoxide`, `fzf`, `starship`, `btop`, `fastfetch` |

---

## 📂 Repository Structure
- `hypr/`: Core WM logic and the "No-Clip" Hyprlock config.
- `matugen/`: Templates for system-wide color generation.
- `scripts/`: Custom utilities like `sunset-check.sh` and `dots`.
- `wallpapers/`: Core assets (e.g., `bebop_city.png`).
- `.bashrc`: Shell configuration, aliases, and the Python `py()` function.

---

## 📥 Installation & Sync

### **1. Replicate Environment**
```bash
# Install official packages
sudo pacman -S --needed - < pkglist.txt

# Install AUR packages (using paru)
paru -S --needed - < aurlist.txt
