#/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

# Create directories
echo "Creating directories."
mkdir -p "/home/$username/.fonts"
mkdir -p "/home/$username/Code"
mkdir -p "/home/$username/AppImages"
mkdir -p "/home/$username/.local/share/wallpapers"
mkdir -p "/home/$username/AppImages/System76KeyboardConfigurator"

# System76 Launch Keyboard configurator
echo "Installing System76 Launch Keyboard Configurator."
cp ../assets/system76KCicon.svg "/home/$username/AppImages/System76KeyboardConfigurator"
cp ../config/.desktop "/home/$username/.local/share/applications"
cd "/home/$username/AppImages/System76KeyboardConfigurator"
wget https://github.com/pop-os/keyboard-configurator/releases/download/v1.3.0/keyboard-configurator-1.3.0-x86_64.AppImage
chmod +x keyboard-configurator-1.3.0-x86_64.AppImage

# Install packages from apt
# pcscd - required by Yubico Authenticator
echo "Installing packages from apt."
apt install sshpass flatpak git neofetch neovim unzip wget curl stow gnome-tweaks aptitude pcscd virtualbox-6.1 ansible grub-customizer steam-devices

# Install Rust
echo "Installing Rust."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Add Flatpak remote repository
echo "Adding Flatpak remote repository."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Download and Install Jetbrains Mono font
echo "Installing Jetbrains Monospace font."
cd "/home/$username/Code" || exit
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.1/JetBrainsMono.zip
unzip JetBrainsMono.zip -d "/home/$username/.fonts"
rm JetBrainsMono.zip
cd "$builddir" || exit

# Install Vimix cursors
# Note: Need to set cursors manually in Gnome Tweaks
echo "Installing Vimix cursors."
cd "/home/$username/Code" || exit
git clone https://github.com/vinceliuice/Vimix-cursors.git
cd Vimix-cursors || exit
./install.sh
cd "$builddir" || exit

# Install Qogir icon theme
# Note: Need to set icons manually in Gnome Tweaks
echo "Installing Qogir icon theme."
cd "/home/$username/Code" || exit
git clone https://github.com/vinceliuice/Qogir-icon-theme.git
cd Qogir-icon-theme || exit
./install.sh
cd "$builddir" || exit

# Install Fluent GTK Theme
# Note: Need to set GTK theme manually in Gnome Tweaks
echo "Installing Fluent GTK theme."
cd "/home/$username/Code" || exit
git clone https://github.com/vinceliuice/Fluent-gtk-theme.git
cd Fluent-gtk-theme || exit
./install.sh
cd "$builddir" || exit

# Clone theme repo for Grub Customizer
# Note: The theme needs to be set manually in grub customizer
echo "Cloning repo for Grub Customizer. Location is /home/$username/Code/distro-grub-themes."
cd "/home/$username/Code" || exit
git clone https://github.com/AdisonCavani/distro-grub-themes.git
cd "$builddir" || exit

# Add light/dark mode wallpaper combo to settings
# Note: Need to set the wallpaper manually in settings
echo "Configuring custom light/dark mode wallpaper."
mkdir -p "/home/$username/.local/share/gnome-background/properties" || exit
touch "/home/$username/.local/share/gnome-background/properties/adwaita.xml.in" || exit
cat <<EOF >/home/$username/.local/share/gnome-background/properties/adwaita.xml.in
<?xml version="1.0"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>
  <wallpaper deleted="false">
    <name>Yosemite Backgrounds</name>
    <filename>$builddir/../assets/yosemite.jpg</filename>
    <filename-dark>$builddir/../assets/yosemite_dark.jpg</filename-dark>
    <options>zoom</options>
    <shade_type>solid</shade_type>
    <pcolor>#3071AE</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>
</wallpapers>
EOF

# Print instructions
echo "Step 3 complete. Reboot now."
