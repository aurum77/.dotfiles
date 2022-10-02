mkdir $HOME/.icons/
mkdir $HOME/.themes/

git clone https://github.com/jmattheis/gruvbox-dark-gtk.git $HOME/.themes/gruvbox-dark-gtk
git clone https://github.com/jmattheis/gruvbox-dark-icons-gtk.git $HOME/.icons/gruvbox-dark-icons-gtk
wget https://github.com/be5invis/Iosevka/releases/download/v16.1.0/ttf-iosevka-16.1.0.zip -O /tmp/ttf-iosevka.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.1/NerdFontsSymbolsOnly.zip -O /tmp/ttf-symbols.zip

unzip -q /tmp/ttf-iosevka.zip -d $HOME/.fonts/
unzip -q /tmp/ttf-symbols.zip -d /tmp/ttf-symbols/
mv /tmp/ttf-symbols/Symbols-2048-em\ Nerd\ Font\ Complete.ttf $HOME/.fonts/
