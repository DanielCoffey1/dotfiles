#!/bin/bash

# Kill existing waybar instances
killall waybar 2>/dev/null

# Wait a moment
sleep 0.5

# Launch three separate waybar instances
waybar -c ~/.config/waybar/config-left.jsonc -s ~/.config/waybar/style-left.css &
waybar -c ~/.config/waybar/config-center.jsonc -s ~/.config/waybar/style-center.css &
waybar -c ~/.config/waybar/config-right.jsonc -s ~/.config/waybar/style-right.css &



