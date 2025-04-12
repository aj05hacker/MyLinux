#!/bin/bash

echo "Welcome to MacOSify for Kali Linux by @aj05hacker!"

# Update and install required packages
sudo apt update && sudo apt install -y gnome-tweaks gnome-shell-extensions curl git

# Install macOS-like GTK theme and icons
mkdir -p ~/.themes ~/.icons

echo "Installing macOS theme and icons..."
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git ~/WhiteSur-gtk-theme
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git ~/WhiteSur-icon-theme

cd ~/WhiteSur-gtk-theme
./install.sh -d ~/.themes

cd ~/WhiteSur-icon-theme
./install.sh -d ~/.icons

# Install cursor theme
git clone https://github.com/ful1e5/apple_cursor.git ~/apple_cursor
mkdir -p ~/.icons/macOS-cursors
cp -r ~/apple_cursor/* ~/.icons/macOS-cursors/

# Set GNOME appearance (you can manually tweak later via GNOME Tweaks)
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-dark"
gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-dark"
gsettings set org.gnome.desktop.interface cursor-theme "macOS-cursors"

# Optional: install mac-style dock (Dash to Dock)
gnome-extensions enable dash-to-dock@micxgx.gmail.com || true

echo "Done! Log out and log in again to apply the full macOS-like experience."
