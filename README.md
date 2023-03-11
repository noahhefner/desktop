# Desktop

These scripts install and configure my desktop setup. Debian testing is used for the base system. The desktop environment is vanilla Gnome. My commonly used apps are installed via Flatpak.

![screenshot_1](/assets/screenshot_1.png)

![screenshot_2](/assets/screenshot_2.png)

## GUI Tweaks and Apps
- Vimix cursors
- Jetbrains Nerd Font
- Qogir Icon Pack

## Flatpak Applications
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
- Foliate

## Other tools
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

# Automated Installation

1. Install Debian w/o DE. [Use this ISO](https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/weekly-builds/amd64/iso-cd/). On the "select and install software" screen, uncheck everything except "standard system utilities"
2. Run `step_1.sh` as root. Reboot.
3. Run `step_2.sh` as root. Reboot.
4. Run `step_3.sh` as root. Reboot.
5. Run `step_4.sh` as user.

## Script Descriptions

`step_1.sh`
  - Add public key for Oracle Virtualbox installation.
  - Add Debian testing source to apt `sources.list` file. Add source for Oracle Virtualbox.
  - Create an apt pinning file to use testing source as first priority.
  - Perform `apt update` and `apt dist-upgrade`.

`step_2.sh`
  - Install vanilla Gnome desktop environment.

`step_3.sh`
  - Create home directories.
  - Install System76 keyboard configurator via AppImage.
  - Install apt packages listed above.
  - Install Rust.
  - Add Flatpak remote repository.
  - Download and install Jetbrains Mono font.
  - Download and install Vimix Cursors.
  - Download and install Qogir Icon pack.
  - Download and install Fluent GTK theme.
  - Clone grub theme repository to `Code` directory.
  - Setup a custom light/dark mode wallpaper.

`step_4.sh`
  - Install Flatpaks.

# Post-Install Steps
- In Gnome Tweak Tool:
  - Set Jetbrains Mono Nerd Font for all fonts.
  - Set Vimix Cusrors for cursors.
  - Set Qogir Icon Pack for icons.
  - Set Fluent as GTK theme.
- Set Grub Theme:
  - `step_3.sh` has already cloned the repository to `~/Code/distro-grub-themes`. 
  - Use Grub Customizer to set the theme to `themes/debian.tar`.

# Troubleshooting

## Fix Wifi networks not showing in Gnome Settings

Helpfull Stack Overflow post [here](https://askubuntu.com/questions/71159/network-manager-says-device-not-managed).

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
