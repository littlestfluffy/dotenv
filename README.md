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
git fetch origin
git checkout --force main
```

### Packages

#### Core Packages

```shell
sudo pacman -S --needed  - < ~/.config/pacman/core.list
```

#### Yay Package Manager

```shell
sudo pacman -S --needed git base-devel 
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin 
makepkg -si
```

#### Audio System

If you're using a laptop you likely also need to manually install the `sof-firmware` package.

#### NVIDIA GPU Drivers

Ensure to enable the `multilib` repository in `/etc/pacman.conf` before installing.

```shell
sudo pacman -S --needed  - < ~/.config/pacman/nvidia.list
```

#### Bluetooth

```shell
sudo systemctl enable --now bluetooth.service
```


#### Network Manager GUI

```shell
sudo yay -S nmgui-bin
```

### User Utilities

```shell
sudo pacman -S qalculate-gtk

# Other tools (browser)
sudo pacman -S vivaldi vivaldi-ffmpeg-codecs libxdamage
sudo pacman -S firefox

# Video player
sudo pacman -S celluloid          

# Notepad/scratch pad
sudo pacman -S textpieces
```

## Live Wallpaper support

Services works well with `waypaper`. You can choose your backend, i.e. `swww` (images) or `mpvpaper` (videos).

```shell
yay -S mpvpaper waypaper
```

Optionally enable the following service to pause the live wallpaper(s) when a fullscreen window is active for better GPU/FPS performance:
```shell
systemctl --user enable --now mpv-fullscreen.timer
```

### Update Notification

```shell
yay -S waybar-updates
```

## Webapps

You can enable certain webapp "repositories" with command:

### List/Enabling available app

```shell
ls -1 ~/.config/webapp/disabled
# chatgpt
# discord
# microsoft
# proton
# spotify
# telegram
# whatsapp
# youtube
```

### Enable app (from disabled list)

```shell
cd ~/.config/webapp/
ln -sf ./disabled/<name> .
```

### Adding apps

Add a file (i.e. `example`) to `~/.config/webapp` in the following format:

```shell
DISPLAY NAME|URL|ICON

i.e.:
Custom Item 1|https://example.org/|application-community
Custom Item 2|https://example.com/|~/.local/share/icons/apps/CustomItem.svg
```

Icon names can be found with i.e.:
```shell
find /usr/share/icons/Papirus/16x16/apps -iname "*QUERY*"
```
