#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

# Create directories
mkdir -p "/home/$username/.config"
mkdir -p "/home/$username/.fonts"
mkdir -p "/home/$username/Code"

# Install programs
nix-env -iA nixpkgs.git nixpkgs.neofetch nixpkgs.neovim nixpkgs.unzip nixpkgs.wget nixpkgs.curl nixpkgs.stow nixpkgs.gnome.gnome-tweaks nixpkgs.bitwarden nixpkgs.brave nixpkgs.discord nixpkgs.spotify nixpkgs.bottles nixpkgs.vscodium nixpkgs.handbrake nixpkgs.joplin-desktop nixpkgs.virtualbox nixpkgs.sound-juicer nixpkgs.picard nixpkgs.onlyoffice-bin nixpkgs.gnome.nautilus nixpkgs.steam nixpkgs.system76-keyboard-configurator

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
echo "Setup complete. A reboot is required to see the apps installed from Nix in the Gnome launcher."