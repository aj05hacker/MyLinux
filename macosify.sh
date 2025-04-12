#!/bin/bash

echo "Welcome to MacOSify for Kali Linux by @aj05hacker (Enhanced Edition)!"

# Update and install required packages
sudo apt update && sudo apt install -y gnome-tweaks gnome-shell-extensions curl git fonts-font-awesome

# Install macOS-like GTK theme and icons
mkdir -p ~/.themes ~/.icons ~/.fonts ~/Pictures

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

# Set appearance
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-dark"
gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-dark"
gsettings set org.gnome.desktop.interface cursor-theme "macOS-cursors"

# Optional: wallpaper setup (user must place a wallpaper manually)
if [ -f ~/Pictures/macos_wallpaper.jpg ]; then
  gsettings set org.gnome.desktop.background picture-uri file:///home/$USER/Pictures/macos_wallpaper.jpg
fi

# Optional: font setup (user must manually install fonts in ~/.fonts)
fc-cache -fv

# Optional: install dash-to-dock
gnome-extensions enable dash-to-dock@micxgx.gmail.com || true

echo "Done! Log out and log in again to enjoy your macOS-like system."
