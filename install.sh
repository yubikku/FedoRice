#!/bin/sh

# Fedora Installation script for a Minimal i3 Setup
# Installs a Minimal base for a Desktop/Window Manager Environement
# Based on Chris Titus's Fedora-Titus Install Script

# Updating System
dnf update -y

# Making .config and Moving dotfiles and Background to .config
mkdir ~/.config
chown $(whoami): ~/.config
mv ./dotconfig/* ~/.config
mv ./bg.jpg ~/.config

# Installing Essential Programs 
dnf install @base-x i3-gaps feh rofi polybar picom thunar nitrogen lxpolkit
# Installing Other less important Programs
dnf install mangohud gimp vim lxappearance
# Installing Custom ocs-url package
dnf install ./rpm-packages/ocs-url-3.1.0-1.fc20.x86_64.rpm

# Installing fonts
# dnf install fontawesome-fonts fontawesome-fonts-web
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
# unzip FiraCode.zip -d /usr/share/fonts
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
# unzip Meslo.zip -d /usr/share/fonts

# Reloading Font
fc-cache -vf
# Removing zip Files
rm ./FiraCode.zip ./Meslo.zip

# Enabling Services and Graphical User Interface
systemctl enable sddm
systemctl set-default graphical.target