# Desktop

These scripts install and configure my desktop setup.

- Base: Debian 11 w/ latest kernel
- Desktop Environment: Gnome
- Packages and Applications: git, neofetch, neovim, unzip, wget, gnome-tweaks, nautilus
- Nix package manager is installed
- Appearance Tweaks: Nordzy cursors, Inverse icon themes

# Installation

1. Install Debian w/o DE. [Use this ISO](https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/weekly-builds/amd64/iso-cd/).
  - On the "select and install software" screen, uncheck everything except "standard system utilities"
2. [Install latest linux kernel](https://www.linuxcapable.com/how-to-install-latest-linux-kernel-on-debian-linux/).
  - Run `update_kernel.sh`.
  - Reboot.
3. [Install latest gnome](https://raspberrytips.com/latest-gnome-installation-debian/).
  - Run `install_gnome.sh`. 
  - Reboot.
4. Run the `setup.sh` script. Reboot.
5. Run the `install_flatpaks.sh` script. Do not run as root.
5. In gnome tweaks, set the cursor, icon pack, and fonts.

# Kernel Install

# GUI Tweaks and Apps
- NordZ cursors
- Gnome files
- Use Jetbrains mono font everywhere

# Flatpak Applications
- Brave
- Spotify
- Joplin
- VSCodium
- Bitwarden
- Sound Juicer
- Oracle Virtualbox
- OnlyOffice
- MusicBrainz Picard
- Steam

# Other apps
- git
- neovim
- neofetch

# Post install
- set jetbrains font for all fonts in tweaks
- install flatpaks `

# Misc notes
- [Installing Virtualbox](https://www.virtualbox.org/wiki/Linux_Downloads)