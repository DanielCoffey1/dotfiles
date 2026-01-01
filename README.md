# Dotfiles

My personal configuration files for Arch Linux with Hyprland.

## System Information

- **OS**: Arch Linux
- **Window Manager**: Hyprland (Wayland)
- **Shell**: Bash
- **Terminal**: Alacritty, Kitty, Ghostty
- **Editor**: Neovim
- **Status Bar**: Waybar
- **App Launcher**: Rofi, Walker
- **Notifications**: Mako

## What's Included

### Window Manager & Desktop
- `hypr/` - Hyprland configuration
- `waybar/` - Status bar configuration
- `mako/` - Notification daemon
- `swayosd/` - On-screen display for volume/brightness

### Terminal & Shell
- `bashrc`, `bash_profile`, `bash_logout` - Bash configuration
- `starship.toml` - Shell prompt configuration
- `alacritty/` - Alacritty terminal emulator
- `kitty/` - Kitty terminal emulator
- `ghostty/` - Ghostty terminal emulator

### Applications
- `nvim/` - Neovim configuration
- `rofi/` - Application launcher
- `walker/` - Alternative launcher
- `btop/` - System monitor
- `fastfetch/` - System information
- `lazygit/` - Git TUI
- `git/` - Git configuration

## Installation

### Fresh Installation

1. Clone this repository:
   ```bash
   git clone <your-repo-url> ~/dotfiles
   cd ~/dotfiles
   ```

2. Run the installation script:
   ```bash
   ./install.sh
   ```

   This will:
   - Backup your existing configs to `~/dotfiles_backup_<timestamp>`
   - Create symlinks from your home directory to the dotfiles

3. Reload your configuration:
   ```bash
   # Reload shell
   source ~/.bashrc

   # Reload Hyprland (if already running)
   hyprctl reload
   ```

### Uninstallation

To remove the symlinks:

```bash
cd ~/dotfiles
./uninstall.sh
```

This will remove all symlinks that point to this dotfiles directory. Your backups will remain in `~/dotfiles_backup_*` directories.

## Directory Structure

```
dotfiles/
├── .config/          # XDG config directory files
│   ├── hypr/
│   ├── waybar/
│   ├── nvim/
│   └── ...
├── home/             # Home directory dotfiles
│   ├── bashrc
│   ├── bash_profile
│   └── bash_logout
├── install.sh        # Installation script
├── uninstall.sh      # Uninstallation script
└── README.md         # This file
```

## Usage

After installation, any changes you make to files in `~/dotfiles/` will immediately affect your system since the actual config files are symlinks.

To track changes:

```bash
cd ~/dotfiles
git status
git add .
git commit -m "Update configuration"
git push
```

## Notes

- Make sure to update the remote repository URL after cloning
- Backups are created automatically during installation
- The install script is idempotent - you can run it multiple times safely

## License

Personal configuration files - use at your own risk!
