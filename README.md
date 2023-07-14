# ⚠ DISCLAIMER ⚠
⚠ THIS REPOSITORY IS STILL WIP SO PLEASE DO NOT FOLLOW STEPS BELOW ⚠

# Table of contents
[TOC]

# Showcase 
(description of what this is supposed to be)
(whoami and what I am doing with this sistem / what it was designed for)
(how it was built / what core packages is it using)
(photo/s)
# Setup
Starting with a fresh arch, install following packages:
## 0. Pacman Packages
```
sddm picom i3 i3-blocks i3-bar i3-gaps 
zsh xplr neovim neofetch nano catimg
rofi wezterm 
rust nodejs python 
nvidia nvidia-settings nvidia-utils 
git base-devel github-cli
nitrogen chromium pavucontrol nautilus inkscape geeqie scrot 
noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
```
#### Aditionals (if u want to)
```
btop fcitx
```
### After install chroot
```
systemctl enable NetworkManager.service
systemctl enable sddm.service
``` 
## 1. Install yay
```
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
cd ..
rm -rf yay-git
```
### Yay Packages
```
blender discord obsidian spotify 
```
## 2. Dotfiles
```
cd ~
git clone (this repo link)
cp -r ~/dotfiles/config/* ~/.config/*
cp -r ~/dotfiles/main/* ~
rm -rf dotfiles
```
### Aditional Fonts
```
https://www.programmingfonts.org/#fantasque-sans
https://www.programmingfonts.org/#share-tech
https://www.1001freefonts.com/zdyk-sagittarius.font
```
Download them and then move them to the font directory:
```
mv ~/Downloads/<font-name> ~/.fonts/ 
```
### X. Finishing touches
to enable a permament dark mode for chromium go to **chrome://flags** and search for *Auto Dark Mode for Web Contents* and set it to **Enabled**
