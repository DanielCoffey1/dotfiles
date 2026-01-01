#!/bin/bash

# Get current power profile
current=$(powerprofilesctl get)

# Define profiles with icons
profiles=(
    "󰓅 Performance:performance"
    "󰾅 Balanced:balanced"
    "󰾆 Power Saver:power-saver"
)

# Build menu options and mark current selection
menu=""
for profile in "${profiles[@]}"; do
    display="${profile%%:*}"
    value="${profile##*:}"
    if [ "$value" = "$current" ]; then
        menu+="$display ✓\n"
    else
        menu+="$display\n"
    fi
done

# Show menu and get selection
selected=$(echo -e "$menu" | rofi -dmenu -i -no-custom \
    -theme-str 'window {width: 12%;}' \
    -theme-str 'mainbox {children: [listview];}' \
    -theme-str 'listview {lines: 3;}')

# Extract the profile value from selection
if [ -n "$selected" ]; then
    # Remove the checkmark if present
    selected="${selected% ✓}"

    # Find matching profile
    for profile in "${profiles[@]}"; do
        display="${profile%%:*}"
        value="${profile##*:}"
        if [ "$display" = "$selected" ]; then
            powerprofilesctl set "$value"
            break
        fi
    done
fi
