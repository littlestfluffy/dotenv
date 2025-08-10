# Installation

## Arch Linux

Pretty much just follow the [Official Installation Guide](https://wiki.archlinux.org/title/Installation_guide);

- Encryption (optional, adjusted instructions for steps `1.1*` and `3.6`): [dm-crypt](https://wiki.archlinux.org/title/Dm-crypt/Device_encryption)
- Pacstrap Packages (Step `2.2`):
  ```shell
  pacstrap -K /mnt base linux linux-firmware amd-ucode sudo vim fish git
  ```
- NetworkManager (Step `3.5`): [networkmanager](https://wiki.archlinux.org/title/NetworkManager)
- Bootloader (Step `3.8`): [systemd-boot](https://wiki.archlinux.org/title/Systemd-boot)

reboot system and login with your normal user;

Prepare dotenv configs from git repository
```shell
git init
git remote add origin https://github.com/littlestfluffy/dotenv.git
git fetch
rm .bashrc #remove auto-generated `.bashrc`
git checkout main
```

### Core Utilities

```shell
sudo pacman -S which wget curl 
sudo pacman -S hyprland hypridle hyprlock hyprpolkitagent hyprshot foot fish nautilus
sudo pacman -S uwsm libnewt
sudo pacman -S otf-font-awesome noto-fonts noto-fonts-extra noto-fonts-emoji noto-fonts-cjk papirus-icon-theme
sudo pacman -S waybar swaync xdg-desktop-portal-hyprland
sudo pacman -S gnome-keyring openssh
sudo pacman -S nwg-displays
```

#### Sound System

If you're using a laptop you likely also need to install the `sof-firmware` package.

```shell
sudo pacman -S pipewire wireplumber pipewire-pulse pipewire-alsa pavucontrol
```

#### NVIDIA GPU Drivers

Ensure to enable the `multilib` repository in `/etc/pacman.conf` before installing.

```shell
sudo pacman -S nvidia-open nvidia-utils lib32-nvidia-utils
```

#### Bluetooth

```shell
sudo pacman -S bluez blueman
sudo systemctl enable --now bluetooth.service
```

### Yay Package Manager

```shell
sudo pacman -S --needed git base-devel 
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin 
makepkg -si
```

#### Network Manager GUI

```shell
sudo yay -S nmgui-bin nm-connection-editor
```

### User Utilities

```shell
sudo pacman -S qalculate-gtk        # calculator
# Other tools (browser)
sudo pacman -S vivaldi vivaldi-ffmpeg-codecs libxdamage
sudo pacman -S firefox

# Video player
sudo pacman -S celluloid          

# Notepad/scratch pad
sudo pacman -S textpieces
```