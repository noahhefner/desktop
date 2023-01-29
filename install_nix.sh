#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Install Nix package manager
apt install wget
wget https://nixos.org/nix/install
chmod +x ./install
./install --daemon
. /home/$username/.nix-profiles/etc/profile.d/nix.sh
rm ./install

# Print instructions
echo "Nix package manager installed."