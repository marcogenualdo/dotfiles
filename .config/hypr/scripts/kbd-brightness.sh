#!/bin/bash
current=$(brightnessctl --device='*::kbd_backlight' get 2>/dev/null || echo "0")
max=$(brightnessctl --device='*::kbd_backlight' max 2>/dev/null || echo "100")
percent=$((current * 100 / max))

if [ "$percent" -lt 20 ]; then
    brightnessctl --device='*::kbd_backlight' set 50%
elif [ "$percent" -lt 70 ]; then
    brightnessctl --device='*::kbd_backlight' set 100%
else
    brightnessctl --device='*::kbd_backlight' set 0%
fi
