# Fedora development station setup

Set up a development computer with Linux using Fedora Minimal, Wayland, Sway and Pipewire.

## Install Fedora Minimal

* [Fedora Minimal Raw](https://fedoraproject.org/spins/minimal/download)
* [Fedora Everything Network Install](https://fedoraproject.org/everything/download)
* [Asahi Linux](https://asahilinux.org)

## Connect to wireless network

NetworkManager is enabled by default. To connect to a wireless network:

```sh
nmcli device wifi list                         # list available networks
nmcli --ask device wifi connect <network-ssid> # connect to network
```

To speed up package installation, install `dnf5` and edit `dnf.conf`:

```sh
sudo dnf copr enable rpmsoftwaremanagement/dnf-nightly
sudo dnf -y install dnf5

echo 'fastestmirror=True' | sudo tee --append /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee --append /etc/dnf/dnf.conf
```

## Packages

```sh
# Desktop environment
sudo dnf -y install sway                   # window manager
sudo dnf -y install foot                   # terminal
sudo dnf -y install pipewire wireplumber   # multimedia server
sudo dnf -y install waypipe                # remote display
sudo dnf -y install libnotify mako         # desktop notification
sudo dnf -y install j4-dmenu-desktop       # find .desktop files
sudo dnf -y install wmenu                  # dynamic menu
sudo dnf -y install brightnessctl          # backlight control
sudo dnf -y install playerctl              # media control
sudo dnf -y install network-manager-applet # networkmanager applet
sudo dnf -y install grim                   # screenshot tool
sudo dnf -y install slurp                  # region selection tool
sudo dnf -y install wf-recorder            # screen recorder
sudo dnf -y install wl-clipboard           # clipboard
sudo dnf -y install bluez                  # bluetooth
sudo dnf -y install bluez-tools            # bluetooth tools
sudo dnf -y install blueman                # bluetooth manager
# sudo dnf -y install greetd                 # login manager

# Status bar
sudo dnf -y copr enable atim/i3status-rust
sudo dnf -y install i3status-rust

# Misc
sudo dnf -y install firefox                # browser
sudo dnf -y install thunar                 # file manager
sudo dnf -y install imv                    # image viewer
sudo dnf -y install mpv                    # video/audio player
sudo dnf -y install zathura-pdf-mupdf      # PDF viewer
sudo dnf -y install fswatch                # file watcher backend
sudo dnf -y install gvfs                   # virtual filesystem
sudo dnf -y install udisks                 # disk management
sudo dnf -y install gvfs-smb               # SMB support for GVFS
sudo dnf -y install ncspot                 # spotify client
sudo dnf -y install darkman                # dark mode manager
sudo dnf -y install qalculate              # calculator
sudo dnf -y install qalculate-gtk          # calculator
sudo dnf -y install wtype                  # keybord typing simulation
sudo dnf -y install fastfetch
sudo dnf -y install croc                   # file transfer tool
sudo dnf -y install jq
sudo dnf -y install yq

# Neovim and deps.
sudo dnf install -y fswatch
sudo dnf install -y ripgrep
sudo dnf install -y fd-find
dnf copr enable agriffis/neovim-nightly
dnf install -y neovim python3-neovim
```

### Codecs and stuff

```sh
# Enable widevine (maybe asahi only)
sudo dnf -y install widevine-installer
widevine-installer

# Enable RPM Fusion repos and install codecs
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager --enable fedora-cisco-openh264
sudo dnf group update core
sudo dnf -y install libavcodec-freeworld
```

### Development

```sh
sudo dnf install java-latest-openjdk
sudo dnf install lua
sudo dnf install go
sudo dnf install rust
sudo dnf install cargo
sudo dnf install just
```

### Maybe

* hyprland copr
* protonvpn copr
* signal messenger copr
* Docker
* Ansible
* Nix

Sources:

* <https://redd.it/1ebxxu5>
* <https://rpmfusion.org/configuration>
* <https://docs.fedoraproject.org/en-US/fedora-asahi-remix/faq>
* <https://docs.fedoraproject.org/en-US/quick-docs/rpmfusion-setup>
