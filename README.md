# Dotfiles

My personal configuration files for Hyprland and Waybar.

## Contents

- **hypr/** - Hyprland window manager configuration
- **waybar/** - Waybar status bar configuration

## Quick Installation

Install all configurations with a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/dotfiles/main/install.sh | bash
```

Or clone and install manually:

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git
cd dotfiles
./install.sh
```

## Manual Installation

If you prefer to install specific components:

### Hyprland
```bash
cp -r hypr ~/.config/
```

### Waybar
```bash
cp -r waybar ~/.config/
```

## Features

### Hyprland
- Custom keybindings and workspace management
- Display and input device configuration
- Aesthetic look and feel settings
- Auto-start applications
- Idle, lock, and sunset configurations

### Waybar
- Multi-bar setup (left, center, right)
- Custom modules and scripts
- Themed styling
- Launch script for easy startup

## Requirements

- Hyprland
- Waybar
- Additional dependencies may be required depending on modules used

## Backup

The installation script automatically creates backups of your existing configurations before installing new ones. Backups are stored in `~/.config_backup_TIMESTAMP/`.

## License

Feel free to use and modify these configurations for your own setup.
