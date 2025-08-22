#!/bin/sh
sudo pacman -Syu git stow

git clone https://aur.archlinux.org/paru-bin /tmp/
( cd /tmp/paru-bin && makepkg -si )
