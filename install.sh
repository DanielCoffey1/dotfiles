#!/bin/bash

# Dotfiles installation script for Hyprland ecosystem
# This script will backup existing configs and install new ones

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"
INSTALL_PLYMOUTH=false

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --with-plymouth)
            INSTALL_PLYMOUTH=true
            shift
            ;;
        *)
            echo "Unknown option: $1"
            echo "Usage: $0 [--with-plymouth]"
            exit 1
            ;;
    esac
done

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

# Install user configurations
install_config "hypr"
install_config "waybar"
install_config "swayosd"
install_config "walker"

# Install Plymouth (requires sudo)
if [ "$INSTALL_PLYMOUTH" = true ]; then
    echo "Installing Plymouth configuration..."
    if [ ! -d "${DOTFILES_DIR}/plymouth" ]; then
        echo "⚠ Plymouth config not found in dotfiles, skipping..."
    elif [ "$EUID" -eq 0 ]; then
        # Running as root
        cp "${DOTFILES_DIR}/plymouth/plymouthd.conf" /etc/plymouth/
        cp -r "${DOTFILES_DIR}/plymouth/themes/"* /usr/share/plymouth/themes/
        echo "✓ Plymouth installed"
        echo ""
    else
        # Need sudo
        echo "Plymouth installation requires root privileges."
        sudo cp "${DOTFILES_DIR}/plymouth/plymouthd.conf" /etc/plymouth/
        sudo cp -r "${DOTFILES_DIR}/plymouth/themes/"* /usr/share/plymouth/themes/
        echo "✓ Plymouth installed"
        echo ""
    fi
fi

echo "===================================="
echo "  Installation Complete!"
echo "===================================="
echo ""
echo "Your configs have been installed to:"
echo "  - Hyprland:  $CONFIG_DIR/hypr"
echo "    (includes hypridle, hyprlock, hyprsunset)"
echo "  - Waybar:    $CONFIG_DIR/waybar"
echo "  - SwayOSD:   $CONFIG_DIR/swayosd"
echo "  - Walker:    $CONFIG_DIR/walker"

if [ "$INSTALL_PLYMOUTH" = true ]; then
    echo "  - Plymouth:  /etc/plymouth & /usr/share/plymouth/themes"
fi

echo ""

if [ -d "$BACKUP_DIR" ]; then
    echo "Previous configs backed up to:"
    echo "  $BACKUP_DIR"
    echo ""
fi

echo "Notes:"
echo "  - Hyprland configs include hypridle, hyprlock, and hyprsunset"
echo "  - You may need to reload services for changes to take effect"
echo "  - To install Plymouth theme, run: ./install.sh --with-plymouth"
echo ""
echo "Reload commands:"
echo "  - Hyprland: hyprctl reload"
echo "  - Waybar:   killall waybar && waybar &"
