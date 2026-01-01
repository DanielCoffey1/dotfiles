#!/bin/bash

# Dotfiles installation script
# This script creates symlinks from ~ to ~/dotfiles

set -e

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "╔════════════════════════════════════════╗"
echo "║     Dotfiles Installation Script      ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Create backup directory
echo "Creating backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# Function to backup and symlink
backup_and_link() {
    local src="$1"
    local dest="$2"

    # If destination exists and is not a symlink, back it up
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "  Backing up: $dest"
        mkdir -p "$(dirname "$BACKUP_DIR/${dest#$HOME/}")"
        mv "$dest" "$BACKUP_DIR/${dest#$HOME/}"
    elif [ -L "$dest" ]; then
        echo "  Removing existing symlink: $dest"
        rm "$dest"
    fi

    # Create parent directory if needed
    mkdir -p "$(dirname "$dest")"

    # Create symlink
    echo "  Linking: $dest -> $src"
    ln -sf "$src" "$dest"
}

# Symlink .config directories
echo ""
echo "Symlinking .config directories..."
for config_dir in "$DOTFILES_DIR/.config"/*; do
    if [ -d "$config_dir" ] || [ -f "$config_dir" ]; then
        config_name=$(basename "$config_dir")
        backup_and_link "$config_dir" "$HOME/.config/$config_name"
    fi
done

# Symlink home directory files
echo ""
echo "Symlinking home directory files..."
for home_file in "$DOTFILES_DIR/home"/*; do
    if [ -f "$home_file" ]; then
        file_name=$(basename "$home_file")
        backup_and_link "$home_file" "$HOME/.$file_name"
    fi
done

echo ""
echo "╔════════════════════════════════════════╗"
echo "║         Installation Complete!         ║"
echo "╚════════════════════════════════════════╝"
echo ""
echo "✓ Dotfiles installed successfully"
echo "✓ Backups saved to: $BACKUP_DIR"
echo ""
echo "You may need to:"
echo "  - Restart your shell or run: source ~/.bashrc"
echo "  - Reload Hyprland: hyprctl reload"
echo ""
