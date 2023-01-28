#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

# Create directories
mkdir -p "/home/$username/.config"
mkdir -p "/home/$username/.fonts"
mkdir -p "/home/$username/Code"

# Some fixes
apt install software-properties-common -y

# Install CLI programs
apt install git neofetch neovim unzip wget curl -y
# Install other programs
apt install gnome-tweaks nautilus -y

# Install Flatpak
apt install flatpak -y
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