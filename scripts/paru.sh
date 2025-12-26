#!/bin/sh
sudo pacman -Syu git stow

git clone https://aur.archlinux.org/yay-bin /tmp/yay-bin
( cd /tmp/yay-bin && makepkg -si )
