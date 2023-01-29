#!/bin/bash

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