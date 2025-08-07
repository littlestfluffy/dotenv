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

```shell
sudo pacman -S hyprland hyprpaper hypridle hyprlock hyprpolkitagent foot # core
sudo pacman -S uwsm libnewt # uwsm desktop loader thingy

# For NVIDIA support
sudo pacman -S nvidia-open nvidia-utils lib32-nvidia-utils

# Other recommended core-ish tools (bar, notification daemons etc)
sudo pacman -S otf-font-awesome noto-fonts noto-fonts-extra noto-fonts-emoji noto-fonts-cjk papirus-icon-theme # fonts
sudo pacman -S waybar swaync xdg-desktop-portal-hyprland # taskbar, notification center
sudo pacman -S pipewire wireplumber pipewire-pulse pipewire-alsa # audio

# Other tools (browser)
sudo pacman -S vivaldi vivaldi-ffmpeg-codecs libxdamage

reboot # system
```

