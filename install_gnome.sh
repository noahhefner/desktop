#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
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