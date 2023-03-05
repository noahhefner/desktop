#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi
echo "Root check passed."

# Add Oracle public key for Virtualbox
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg
echo "Added Oracle public key (for installing Virtualbox.)"

# Update packages sources
rm /etc/apt/sources.list
cp ../config/sources.list /etc/apt/sources.list
echo "Updated apt sources file /etc/apt/sources.list."

# Create apt pinning file
cp ../config/preferences /etc/apt/preferences
echo "Created apt pinning file /etc/apt/preferences."

# Update and upgrade
apt update && sudo apt dist-upgrade -y

# Print instructions
echo "Step 1 complete. Reboot now."