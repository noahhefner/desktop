#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Update packages sources
rm /etc/apt/sources.list
cp ./sources.list /etc/apt/sources.list

# Create apt pinning file
cp ./preferences /etc/apt/preferences

# Update and upgrade
apt update && sudo apt upgrade -y

# Print instructions
echo "Linux kernel updated to latest version. Restart now."