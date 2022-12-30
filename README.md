# ⚠ DISCLAIMER ⚠
⚠ THIS REPOSITORY IS STILL WIP SO PLEASE DO NOT FOLLOW STEPS BELOW ⚠

# Table of contents
- [⚠ DISCLAIMER ⚠](#-disclaimer-)
- [Table of contents](#table-of-contents)
- [Dotfiles](#dotfiles)
  - [Setup](#setup)
    - [0. (multiple screens step) install nvidia tools](#0-multiple-screens-step-install-nvidia-tools)
    - [1. Install yay](#1-install-yay)
    - [2. Install required packages](#2-install-required-packages)
    - [3. Setup symbolic links](#3-setup-symbolic-links)


# Dotfiles
This repository is a colection of dotfiles for arch on desktop 
## Setup
### 0. (multiple screens step) install nvidia tools
```
sudo pacman -S nvidia nvidia-utils nvidia-settings
```
then adjust the monitors in nvidia-settings

### 1. Install yay
```
sudo pacman -S git base-devel
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R spaceaxolotl:spaceaxolotl ./yay-git
cd yay-git
makepkg -si
```
### 2. Install required packages
```
yay -S picom-git awesome-git acpid git mpd ncmpcpp wmctrl \
lxappearance gucharmap alacritty polkit-gnome \
xdotool xclip scrot brightnessctl alsa-utils pulseaudio jq rofi \
inotify-tools zsh mpdris2 acpi acpi_call \
playerctl redshift cutefish-cursor-themes-git cutefish-icons upower xorg xorg-init tar
```


### 3. Setup symbolic links
```
rm ~/.config/alacritty/alacritty.yml
ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

rm ~/.config/fish/config.fish
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish

rm -rf ~/.config/awesome
cp ~/dotfiles/awesome ~/.config
```