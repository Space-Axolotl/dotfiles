# ⚠ DISCLAIMER ⚠
⚠ THIS REPOSITORY IS STILL WIP SO PLEASE DO NOT FOLLOW STEPS BELOW ⚠

# Showcase 
(description of what this is supposed to be)
(whoami and what I am doing with this sistem / what it was designed for)
(how it was built / what core packages is it using)
(photo/s)
# Setup
Starting with a fresh arch, install following packages:
## 0. Pacman Packages

If you want to install all packages at once, run:
```
sudo pacman -S rofi nitrogen wezterm zsh xplr neovim neofetch catimg scrot rust nodejs python git base-devel github-cli nvidia nvidia-settings nvidia-utils nitrogen chromium pavucontrol nautilus inkscape geeqie noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra 
```
In the case you want to install only a selection of those packages below you will find packages you can install with descriptions
<details>
  <summary>Click me</summary>

  gui packages
  ```sh
  sudo pacman -S sway rofi nitrogen
  ```
  terminal and cli tools
  ```sh
  sudo pacman -S wezterm zsh xplr neovim neofetch nano catimg scrot
  ```
  programming languages
  ```sh
  sudo pacman -S rust nodejs python
  ```
  git and development packages
  ```sh
  sudo pacman -S git base-devel github-cli
  ```
  nvidia utils
  ```sh
  sudo pacman -S nvidia nvidia-settings nvidia-utils
  ```
  gui tools
  ```sh
  sudo pacman -S nitrogen chromium pavucontrol nautilus inkscape geeqie
  ```
  fonts
  ```sh
  sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
  ```
  #### Aditionals (if u want to)
  ```sh
  sudo pacman -S btop fcitx
  ```
</details>

### After install chroot
```
systemctl enable NetworkManager.service
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
yay -S blender discord obsidian spotify
```
## 2. Dotfiles
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
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/NerdFontsSymbolsOnly.zip
```
Download them and then move them to the font directory:
```
mv ~/Downloads/<font-name> ~/.fonts/
```
### X. Finishing touches
to enable a permament dark mode for chromium go to **chrome://flags** and search for *Auto Dark Mode for Web Contents* and set it to **Enabled**
