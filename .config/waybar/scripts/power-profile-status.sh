#!/bin/bash

# Get current power profile
profile=$(powerprofilesctl get)

# Map profile to icon and text
case "$profile" in
    "performance")
        icon="󰓅"
        text="Performance"
        ;;
    "balanced")
        icon="󰾅"
        text="Balanced"
        ;;
    "power-saver")
        icon="󰾆"
        text="Power Saver"
        ;;
    *)
        icon="󰚥"
        text="Unknown"
        ;;
esac

# Output in waybar format
echo "{\"text\":\"$icon\", \"tooltip\":\"Power Profile: $text\", \"class\":\"$profile\"}"
