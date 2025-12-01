#!/bin/bash

# Dotfiles installation script for Hyprland and Waybar
# This script will backup existing configs and install new ones

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"

echo "===================================="
echo "  Dotfiles Installation Script"
echo "===================================="
echo ""

# Function to backup and install config
install_config() {
    local name=$1
    local source="${DOTFILES_DIR}/${name}"
    local target="${CONFIG_DIR}/${name}"

    if [ -d "$target" ] || [ -f "$target" ]; then
        echo "Backing up existing $name config to $BACKUP_DIR/$name"
        mkdir -p "$BACKUP_DIR"
        cp -r "$target" "$BACKUP_DIR/"
    fi

    echo "Installing $name configuration..."
    mkdir -p "$(dirname "$target")"
    cp -r "$source" "$CONFIG_DIR/"
    echo "✓ $name installed"
    echo ""
}

# Install configurations
install_config "hypr"
install_config "waybar"

echo "===================================="
echo "  Installation Complete!"
echo "===================================="
echo ""
echo "Your configs have been installed to:"
echo "  - Hyprland: $CONFIG_DIR/hypr"
echo "  - Waybar:   $CONFIG_DIR/waybar"
echo ""

if [ -d "$BACKUP_DIR" ]; then
    echo "Previous configs backed up to:"
    echo "  $BACKUP_DIR"
    echo ""
fi

echo "You may need to reload Hyprland and Waybar for changes to take effect."
echo "  - Reload Hyprland: hyprctl reload"
echo "  - Restart Waybar: killall waybar && waybar &"
