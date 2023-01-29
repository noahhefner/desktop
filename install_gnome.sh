#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -e 0 ]]; then
  echo "Do not run this script as root. Please run ./install.sh" 2>&1
  exit 1
fi

# Install Gnome desktop environment
nix-env -iA \
  nixpkgs.gnome.gnome-session \
  nixpkgs.gnome.gnome-shell \
  nixpkgs.gnome.gnome-terminal \
  nixpkgs.gnome.gnome-backgrounds \
  nixpkgs.gnome.gnome-applets \
  nixpkgs.gnome.gnome-control-center \
  nixpkgs.gnome.mutter \ 
  nixpkgs.gjs

# Print instructions
echo "Gnome has been installed. Restart now."