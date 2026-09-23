#!/usr/bin/env bash
# keybinds.sh - Hyprland keybind cheat sheet in Rofi (Crimson Temple)
# Location: ~/.config/hypr/scripts/keybinds.sh
# Bound to Super + / in hyprland.lua
#
# Type to filter (e.g. "work" shows workspace binds). Esc closes.
# This list is written by hand: when you add a keybind in hyprland.lua, add a line here too.

# Section headers use Pango markup (Rofi's text styling) to render in crimson
h() { echo "<span foreground='#e9445e'><b>$1</b></span>"; }

{
h "APPS"
echo "Super + Q                 Terminal (kitty)"
echo "Super + R                 App launcher (Rofi)"
echo "Super + E                 File manager (Nautilus)"
echo ""
h "WINDOWS"
echo "Super + C                 Close window"
echo "Super + V                 Toggle floating"
echo "Super + F                 Fullscreen (covers bar)"
echo "Super + Shift + F         Maximize (keeps bar + gaps)"
echo "Super + J                 Flip split direction"
echo "Super + P                 Pseudo-tile"
echo "Super + Arrows            Move focus"
echo "Super + Shift + Arrows    Move window"
echo "Super + Left drag         Move window with mouse"
echo "Super + Right drag        Resize window with mouse"
echo ""
h "WORKSPACES"
echo "Super + 1-9, 0            Go to workspace 1-10"
echo "Super + Shift + 1-9, 0    Send window to workspace 1-10"
echo "Super + Scroll            Cycle through workspaces"
echo "Super + S                 Show / hide scratchpad"
echo "Super + Shift + S         Send window to scratchpad"
echo ""
h "SYSTEM"
echo "Super + L                 Lock screen"
echo "Super + Escape            Power menu"
echo "Super + M                 Log out"
echo "Super + /                 This cheat sheet"
echo "Print                     Screenshot area → clipboard"
echo "Shift + Print             Screenshot screen → clipboard"
echo "Volume / media keys       Volume, mute, play/pause, next, prev"
echo ""
h "ESCAPE HATCHES"
echo "Ctrl + Alt + F3           Text console (if the desktop breaks)"
echo "Ctrl + Alt + F1 / F2      Back to the graphical session"
} | rofi -dmenu -i -markup-rows -no-custom \
        -p "Keys" \
        -theme-str 'window { width: 760px; } listview { lines: 18; } inputbar { children: [prompt, entry]; }' \
        > /dev/null
