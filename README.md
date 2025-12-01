# Dotfiles

My personal configuration files for Hyprland ecosystem and related tools.

## Contents

- **hypr/** - Hyprland window manager configuration
  - Includes hypridle, hyprlock, and hyprsunset configs
- **waybar/** - Waybar status bar configuration
- **swayosd/** - SwayOSD on-screen display configuration
- **walker/** - Walker application launcher configuration
- **plymouth/** - Plymouth boot splash theme (omarchy)

## Quick Installation

Install all configurations with a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/DanielCoffey1/dotfiles/master/install.sh | bash
```

To include Plymouth theme (requires sudo):

```bash
curl -fsSL https://raw.githubusercontent.com/DanielCoffey1/dotfiles/master/install.sh | bash -s -- --with-plymouth
```

Or clone and install manually:

```bash
git clone https://github.com/DanielCoffey1/dotfiles.git
cd dotfiles
./install.sh

# With Plymouth
./install.sh --with-plymouth
```

## Manual Installation

If you prefer to install specific components:

### Hyprland (including hypridle, hyprlock, hyprsunset)
```bash
cp -r hypr ~/.config/
```

### Waybar
```bash
cp -r waybar ~/.config/
```

### SwayOSD
```bash
cp -r swayosd ~/.config/
```

### Walker
```bash
cp -r walker ~/.config/
```

### Plymouth
```bash
sudo cp plymouth/plymouthd.conf /etc/plymouth/
sudo cp -r plymouth/themes/* /usr/share/plymouth/themes/
```

## Features

### Hyprland
- Custom keybindings and workspace management
- Display and input device configuration
- Aesthetic look and feel settings
- Auto-start applications
- **hypridle** - Idle daemon configuration
- **hyprlock** - Screen locker configuration
- **hyprsunset** - Blue light filter configuration

### Waybar
- Multi-bar setup (left, center, right)
- Custom modules and scripts
- Themed styling with Catppuccin variants
- Launch script for easy startup
- Integration with Hyprland workspaces

### SwayOSD
- On-screen display for volume and brightness
- Custom styling

### Walker
- Application launcher configuration
- Custom keybindings and appearance

### Plymouth
- Custom boot splash theme (omarchy)
- Smooth boot experience

## Requirements

- Hyprland
- Waybar
- hypridle
- hyprlock
- hyprsunset
- SwayOSD
- Walker
- Plymouth (optional)
- Additional dependencies may be required depending on modules used

## Backup

The installation script automatically creates backups of your existing configurations before installing new ones. Backups are stored in `~/.config_backup_TIMESTAMP/`.

## License

Feel free to use and modify these configurations for your own setup.
