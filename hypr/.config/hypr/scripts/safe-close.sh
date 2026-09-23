#!/usr/bin/env bash
# safe-close.sh - Super+C, except for protected windows
# Add more classes to the list with |, e.g. '^(DDLC|Monika After Story)$'

PROTECTED='^(DDLC)$'

# Read the focused window's class from hyprctl
class=$(hyprctl activewindow | sed -n 's/^\s*class: //p' | head -1)

if [[ "$class" =~ $PROTECTED ]]; then
    notify-send "Protected window" "Say goodbye to Monika first 💚"
    exit 0
fi

hyprctl dispatch 'hl.dsp.window.close()'
