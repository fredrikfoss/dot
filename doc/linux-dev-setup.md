# Linux development setup

Set up a development computer with Linux using Fedora Minimal, Wayland, Sway and Pipewire.

## Install Fedora Minimal

* [Download Fedora Minimal 40](https://fedoraproject.org/spins/minimal/download)
* [Linux on Apple Silicon](https://asahilinux.org)

## Connect to wireless network

NetworkManager is enabled by default. To connect to a wireless network:

```sh
nmcli device wifi list                         # list available networks
nmcli --ask device wifi connect <network-ssid> # connect to network
```

To speed up package installation, install `dnf5` and edit `dnf.conf`:

```sh
sudo dnf -y install dnf5
```

```sh
sudo vi /etc/dnf/dnf.conf
# add the following lines:
fastestmirror=True
max_parallel_downloads=10
```

## Widevine

To make Widewine available for Firefox, use the widewine installer script:

```sh
widewine-installer
```

## Essential packages

```sh
sudo dnf -y install foot                 # terminal
sudo dnf -y install sway                 # window manager
sudo dnf -y install pipewire wireplumber # multimedia server
sudo dnf -y install libnotify mako       # desktop notification
```

## Other packages

```sh
sudo dnf -y install thunar                 # file manager
sudo dnf -y install imv                    # image viewer
sudo dnf -y install zathura                # PDF viewer
sudo dnf -y install mpv                    # video/audio player
sudo dnf -y install wmenu                  # dynamic menu
sudo dnf -y install wf-recorder            # screen recorder
sudo dnf -y install firefox                # browser
sudo dnf -y install brightnessctl          # backlight control
sudo dnf -y install playerctl              # media control
sudo dnf -y install network-manager-applet # networkmanager applet
sudo dnf -y install bluez                  # bluetooth
sudo dnf -y install bluez-tools            # bluetooth tools
sudo dnf -y install blueman                # bluetooth manager
sudo dnf -y install greetd                 # login manager
sudo dnf -y install grim                   # screenshot tool
sudo dnf -y install slurp                  # region selection tool
sudo dnf -y install wl-clipboard           # clipboard
sudo dnf -y install waypipe                # remote display
sudo dnf -y install i3status-rust          # status bar
sudo dnf -y install gvfs                   # virtual filesystem
sudo dnf -y install fswatch                # file watcher backend
sudo dnf -y install udisks                 # disk management
sudo dnf -y install gvfs-smb               # SMB support for GVFS
sudo dnf -y install croc                   # file transfer tool
sudo dnf -y install ncspot                 # spotify client
sudo dnf -y install darkman                # dark mode manager
sudo dnf -y install qalculate              # calculator
```
