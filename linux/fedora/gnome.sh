#!/usr/bin/env bash

# GNOME Settings for Fedora
# =========================
# Run with: bash ~/dotfiles/linux/fedora/gnome.sh

set -euo pipefail

echo "Configuring GNOME settings..."

###############################################################################
# Keyboard
###############################################################################

echo "Setting Keyboard preferences..."

# Fast key repeat
gsettings set org.gnome.desktop.peripherals.keyboard delay 250
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 25

# Caps Lock as additional Escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

###############################################################################
# Touchpad
###############################################################################

echo "Setting Touchpad preferences..."

# Tap to click
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

# Natural scrolling
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

# Two finger scrolling
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true

###############################################################################
# Interface
###############################################################################

echo "Setting Interface preferences..."

# Dark theme
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Show battery percentage
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Clock format (24h)
gsettings set org.gnome.desktop.interface clock-format '24h'

# Show weekday in clock
gsettings set org.gnome.desktop.interface clock-show-weekday true

###############################################################################
# Window Management
###############################################################################

echo "Setting Window preferences..."

# Focus follows mouse (optional - uncomment if preferred)
# gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'

# Center new windows
gsettings set org.gnome.mutter center-new-windows true

###############################################################################
# Files (Nautilus)
###############################################################################

echo "Setting Files (Nautilus) preferences..."

# Show hidden files
gsettings set org.gnome.nautilus.preferences show-hidden-files true

# Sort folders before files
gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true
gsettings set org.gtk.Settings.FileChooser sort-directories-first true

###############################################################################
# Privacy
###############################################################################

echo "Setting Privacy preferences..."

# Disable location services
gsettings set org.gnome.system.location enabled false

# Disable usage statistics
gsettings set org.gnome.desktop.privacy report-technical-problems false

###############################################################################
# Power
###############################################################################

echo "Setting Power preferences..."

# Don't suspend when plugged in
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'

# Dim screen when on battery
gsettings set org.gnome.settings-daemon.plugins.power idle-dim true

echo ""
echo "Done! Some changes may require a logout to take effect."
