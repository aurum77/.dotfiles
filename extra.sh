#!/bin/bash

git clone https://github.com/jmattheis/gruvbox-dark-gtk.git $HOME/.local/share/themes/gruvbox-dark-gtk
git clone https://github.com/jmattheis/gruvbox-dark-icons-gtk.git $HOME/.local/share/icons/gruvbox-dark-icons-gtk
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip /tmp/Iosevka.zip
unzip /tmp/Iosevka.zip -d $HOME/.local/share/fonts/Iosevka
