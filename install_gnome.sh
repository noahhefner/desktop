#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Update packages list and update system
apt update
apt upgrade -y

# Install Gnome desktop + terminal
apt install gnome-session gnome-terminal -y

# Print instructions
echo "Gnome installed, restart now."