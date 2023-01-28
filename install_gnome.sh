#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Update packages list and update system
apt update && apt upgrade -y

# Install Gnome desktop environment
apt -t unstable install gnome-session gnome-shell gnome-terminal gnome-backgrounds gnome-applets gnome-control-center mutter gjs

# Print instructions
echo "Gnome installed. Restart now."