# ⚠ DISCLAIMER ⚠
⚠ THIS REPOSITORY IS STILL WIP SO PLEASE DO NOT FOLLOW STEPS BELOW ⚠

# Showcase 
(description of what this is supposed to be)
(whoami and what I am doing with this sistem / what it was designed for)
(how it was built / what core packages is it using)
(photo/s)
# Setup
Starting with a fresh arch, install following packages:
## 1. Atfer fresh install
```
arch-chroot /mnt
systemctl enable NetworkManager.service
systemctl enable ly.service
```
To install all the pacman packages at once, run:
```
sudo pacman -S i3 picom ly rofi nitrogen wezterm zsh xplr neovim neofetch catimg scrot rust nodejs python git base-devel github-cli nvidia nvidia-settings nvidia-utils nitrogen chromium pavucontrol nautilus inkscape geeqie noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra 
```
## 2. Install yay
```
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
cd ..
rm -rf yay-git
```
### Install yay packages
```
yay -S blender discord spotify
```
## 2. Installing the dotfiles
before you do anything change your shell to zsh by:
```
chsh -s /bin/zsh
```
```
cd ~
git clone https://github.com/thanxolotl/dotfiles.git
cd dotfiles
./install
cd ..
rm -rf dotfiles
```
### Aditional Fonts
```
https://www.programmingfonts.org/#fantasque-sans
https://www.programmingfonts.org/#share-tech
https://www.1001freefonts.com/zdyk-sagittarius.font
https://www.1001freefonts.com/earth-orbiter.font
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/NerdFontsSymbolsOnly.zip
```
Download them and then move them to the font directory:
```
mv ~/Downloads/<font-name> ~/.fonts/
```

## Aditionals
(TODO) 
 - Logseq
 - customize neofetch
 - fully customize neovim
 - (maybe) customize zsh theme
