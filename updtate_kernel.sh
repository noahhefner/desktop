#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Add unstable repositories
echo "deb http://deb.debian.org/debian unstable main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian unstable main contrib non-free" | sudo tee -a /etc/apt/sources.list

# TODO: Make all repositories contrib and non-free

# Create apt pinning file
tee /etc/apt/preferences<<EOF
Package: *
Pin: release a=bullseye
Pin-Priority: 500

Package: linux-image-amd64
Pin:release a=unstable
Pin-Priority: 1000

Package: *
Pin: release a=unstable
Pin-Priority: 100
EOF

# Update and upgrade
apt update && sudo apt upgrade -y

# Print instructions
echo "Linux kernel updated to latest version. Restart now."