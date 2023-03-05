#!/bin/bash

# Install Flatpaks
echo "Installing Flatpaks."
xargs flatpak install flathub -y < ./../config/flatpaks.txt

# Print instructions
echo "Step 4 complete. No need to reboot. Setup is now complete!"