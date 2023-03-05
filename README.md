# Desktop

These scripts install and configure my desktop setup. Debian testing is used for the base system. The desktop environment is vanilla Gnome. My commonly used apps are installed via Flatpak.

![screenshot_1](/assets/screenshot_1.png)

![screenshot_2](/assets/screenshot_2.png)

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

# GUI Tweaks and Apps
- Vimix cursors
- Jetbrains Nerd Font
- Qogir Icon Pack

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
- Flatseal
- Bottles
- Gnome Calendar
- Handbrake
- ProtonUp-Qt
- Gnome Contacts
- Yubico Authenticator

# Other tools
- sshpass 
- flatpak 
- git 
- neofetch 
- neovim 
- unzip 
- wget 
- curl 
- stow 
- gnome-tweaks 
- aptitude 
- pcscd 
- virtualbox-6.1 
- ansible 
- grub-customizer

# Manual Post-Install Steps
- In Gnome Tweak Tool:
  - Set Jetbrains Mono Nerd Font for all fonts.
  - Set Nordzy Cusrors for cursors.
  - Set Inverse Icon Pack for icons.
  - Set Fluent as GTK theme.
- Set Grub Theme:
  - `setup.sh` has already cloned the repository to `~/Code/distro-grub-themes`. 
  - Use Grub Customizer to set the theme to `themes/debian.tar`.

## Fix Wifi networks not showing in Gnome Settings

[Helpfull Stack Overflow post](https://askubuntu.com/questions/71159/network-manager-says-device-not-managed)

In `/etc/NetworkManager/NetworkManager.conf`, set managed to true:
```
[main]
plugins=ifupdown,keyfile

[ifupdown]
managed=true
```

In `/etc/network/interfaces`, remove everything except the following:
```
auto lo
iface lo inet loopback
```

Restart Network Manager:
`sudo service NetworkManager restart`

Reboot and wifi should work.

## Yubikey Not Recognized in Yubico Authenticator

Probably caused by `pcscd` service not running. To enable it:
```
sudo service pcscd enable
sudo service pcscd start
```

# Other Notes
- [Installing Virtualbox](https://www.virtualbox.org/wiki/Linux_Downloads)
