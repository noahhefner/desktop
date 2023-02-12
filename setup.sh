#/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

# Create directories
mkdir -p "/home/$username/.fonts"
mkdir -p "/home/$username/Code"
mkdir -p "/home/$username/AppImages"
mkdir -p "/home/$username/.local/share/wallpapers"
mkdir -p "/home/$username/AppImages/System76KeyboardConfigurator"

# System76 Launch Keyboard configurator
cp ./system76KCicon.svg "/home/$username/AppImages/System76KeyboardConfigurator"
cp ./.desktop "/home/$username/.local/share/applications"
cd "/home/$username/AppImages/System76KeyboardConfigurator"
wget https://github.com/pop-os/keyboard-configurator/releases/download/v1.3.0/keyboard-configurator-1.3.0-x86_64.AppImage
chmod +x keyboard-configurator-1.3.0-x86_64.AppImage

# Install packages from apt
apt install sshpass flatpak git neofetch neovim unzip wget curl stow gnome-tweaks aptitude pcscd virtualbox-6.1 ansible grub-customizer

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Add Flatpak remote repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Jetbrains Mono font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.1/JetBrainsMono.zip
unzip JetBrainsMono.zip -d "/home/$username/.fonts"
# Delete zip file
rm JetBrainsMono.zip

# Install Nordzy cursor
cd "/home/$username/Code" || exit
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors || exit
./install.sh
cd .. || exit
rm -rf Nordzy-cursors
cd "$builddir" || exit

# Install Inverse icon theme
cd "/home/$username/Code" || exit
git clone https://github.com/yeyushengfan258/Inverse-icon-theme.git
cd Inverse-icon-theme || exit
./install.sh -a
cd .. || exit
rm -rf Inverse-icon-theme
cd "$builddir" || exit

# Install Fluent GTK Theme
cd "/home/$username/Code" || exit
git clone https://github.com/vinceliuice/Fluent-gtk-theme.git
cd Fluent-gtk-theme || exit
./install.sh
cd .. || exit
rm -rf Fluent-gtk-theme
cd "$builddir" || exit

# Clone theme repo for Grub Customizer
cd "/home/$username/Code" || exit
git clone https://github.com/AdisonCavani/distro-grub-themes.git

# Add light/dark mode wallpaper combo to settings
mkdir -p "/home/$username/.local/share/gnome-background/properties" || exit
touch "/home/$username/.local/share/gnome-background/properties/adwaita.xml.in" || exit
cat <<EOF >/home/$username/.local/share/gnome-background/properties/adwaita.xml.in
<?xml version="1.0"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>
  <wallpaper deleted="false">
    <name>Yosemite Backgrounds</name>
    <filename>$builddir/yosemite.jpg</filename>
    <filename-dark>$builddir/yosemite_dark.jpg</filename-dark>
    <options>zoom</options>
    <shade_type>solid</shade_type>
    <pcolor>#3071AE</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>
</wallpapers>
EOF

# Instructions
echo "Setup complete. Reboot."
