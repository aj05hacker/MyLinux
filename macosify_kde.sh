#!/bin/bash

echo "🍏 MacOSifying your KDE desktop, boss... Hang tight."

# Update & install dependencies
sudo apt update
sudo apt install -y latte-dock unzip curl git fonts-noto fonts-firacode

# Create theme directory
mkdir -p ~/.local/share/plasma/look-and-feel/
mkdir -p ~/.local/share/icons/
mkdir -p ~/.local/share/plasma/desktoptheme/
mkdir -p ~/.local/share/fonts/

# Install Global Theme
echo "🎨 Installing WhiteSur KDE theme..."
git clone https://github.com/vinceliuice/WhiteSur-kde.git /tmp/whitesur-kde
cd /tmp/whitesur-kde
./install.sh -n WhiteSur -c Dark -i

# Install Icons
echo "🧩 Installing WhiteSur icons..."
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git /tmp/whitesur-icons
cd /tmp/whitesur-icons
./install.sh

# Install Cursor
echo "🖱️ Installing macOS cursor..."
git clone https://github.com/ful1e5/apple_cursor.git /tmp/apple-cursor
cd /tmp/apple-cursor
./install.sh

# Install Fonts (San Francisco)
echo "🔤 Installing San Francisco font..."
cd /tmp
git clone https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts
cp -r San-Francisco-Pro-Fonts/*.ttf ~/.local/share/fonts/
fc-cache -fv

# Install Latte Dock
echo "🛶 Installing Latte Dock..."
sudo apt install -y latte-dock

# Download Latte Dock Layout
echo "📦 Downloading macOS-style Latte Dock layout..."
mkdir -p ~/.config/latte
curl -L -o ~/.config/latte/macOS.layout.latte https://raw.githubusercontent.com/abdulhajees/linux-styles/main/macOS.layout.latte

# Start latte-dock with layout
latte-dock --import-layout ~/.config/latte/macOS.layout.latte
latte-dock &

echo "✅ Done, boss! Log out and back in for all changes to take full effect."
echo "🌈 Now go shine with that sweet Mac-style KDE!"
