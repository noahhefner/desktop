#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

# Create directories
mkdir -p "/home/$username/.fonts"
mkdir -p "/home/$username/Code"
mkdir -p "/home/$username/AppImages"
mkdir -p "/home/$username/.local/share/wallpapers"
mkdir -p "/home/$username/AppImages/System76KeyboardConfigurator"

# Add Oracle public key for Virtualbox
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg
apt update

# System76 Launch Keyboard configurator
cp ./system76KCicon.svg "/home/$username/AppImages/System76KeyboardConfigurator"
cp ./.desktop "/home/$username/.local/share/applications"
cd "/home/$username/AppImages/System76KeyboardConfigurator"
wget https://github.com/pop-os/keyboard-configurator/releases/download/v1.3.0/keyboard-configurator-1.3.0-x86_64.AppImage
chmod +x keyboard-configurator-1.3.0-x86_64.AppImage

# Install programs from apt
apt install flatpak git neofetch neovim unzip wget curl stow gnome-tweaks virtualbox-6.1

# Add Flatpak remote repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Jetbrains Mono font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.1/JetBrainsMono.zip
unzip JetBrainsMono.zip -d "/home/$username/.fonts"
# Delete zip file
rm JetBrainsMono.zip

# Install Nordzy cursor
cd "/home/$username/Code" || exit
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors || exit
./install.sh
cd .. || exit
rm -rf Nordzy-cursors
cd "$builddir" || exit

# Install Inverse icon theme
cd "/home/$username/Code" || exit
git clone https://github.com/yeyushengfan258/Inverse-icon-theme.git
cd Inverse-icon-theme || exit
./install.sh -a
cd .. || exit
rm -rf Inverse-icon-theme
cd "$builddir" || exit

# Instructions
echo "Setup complete. Reboot."