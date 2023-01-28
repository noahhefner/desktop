#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Ensure wget is installed
apt install wget

# Download and run Nix install script
wget https://nixos.org/nix/install
chmod +x ./install
./install --daemon

# Print instructions
echo "Nix package manager has been installed. Reboot now."