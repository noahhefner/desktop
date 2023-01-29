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

# Install Nix package manager
cd "/home/$username/Code" || exit
apt install wget
wget https://nixos.org/nix/install
chmod +x ./install
./install --daemon
. /home/$username/.nix-profiles/etc/profile.d/nix.sh
rm ./install
cd "$builddir" || exit

# Install programs
nix-env -iA \
# CLU Utilities
  nixpkgs.git \
  nixpkgs.neofetch \
  nixpkgs.neovim \
  nixpkgs.unzip \
  nixpkgs.wget \
  nixpkgs.curl \
  nixpkgs.stow \
# Applications
  nixpkgs.gnome.gnome-tweaks \
  nixpkgs.bitwarden \
  nixpkgs.brave \
  nixpkgs.discord \
  nixpkgs.spotify \
  nixpkgs.bottles \
  nixpkgs.vscodium \
  nixpkgs.handbrake \
  nixpkgs.joplin-desktop \
  nixpkgs.virtualbox \
  nixpkgs.sound-juicer \
  nixpkgs.picard \
  nixpkgs.onlyoffice-bin \
  nixpkgs.gnome.nautilus

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