#!/bin/bash

# Dotfiles uninstallation script
# This script removes symlinks created by install.sh

set -e

DOTFILES_DIR="$HOME/dotfiles"

echo "╔════════════════════════════════════════╗"
echo "║    Dotfiles Uninstallation Script     ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Function to remove symlink if it points to dotfiles
remove_if_dotfiles_link() {
    local link="$1"

    if [ -L "$link" ]; then
        local target=$(readlink "$link")
        if [[ "$target" == "$DOTFILES_DIR"* ]]; then
            echo "  Removing: $link"
            rm "$link"
        fi
    fi
}

# Remove .config symlinks
echo "Removing .config symlinks..."
for config_dir in "$DOTFILES_DIR/.config"/*; do
    if [ -d "$config_dir" ] || [ -f "$config_dir" ]; then
        config_name=$(basename "$config_dir")
        remove_if_dotfiles_link "$HOME/.config/$config_name"
    fi
done

# Remove home directory symlinks
echo ""
echo "Removing home directory symlinks..."
for home_file in "$DOTFILES_DIR/home"/*; do
    if [ -f "$home_file" ]; then
        file_name=$(basename "$home_file")
        remove_if_dotfiles_link "$HOME/.$file_name"
    fi
done

echo ""
echo "╔════════════════════════════════════════╗"
echo "║      Uninstallation Complete!          ║"
echo "╚════════════════════════════════════════╝"
echo ""
echo "✓ Dotfiles symlinks removed"
echo ""
echo "Note: Your backup files are still in dotfiles_backup_* directories"
echo "      You can restore them manually if needed"
echo ""
