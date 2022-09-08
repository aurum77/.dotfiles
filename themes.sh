mkdir $HOME/.icons/
mkdir $HOME/.themes/

wget https://github.com/m4thewz/dracula-icons/archive/refs/heads/main.zip -O /tmp/dracula-icons.zip
wget https://github.com/dracula/gtk/archive/refs/heads/master.zip -O /tmp/dracula-gtk.zip
wget https://github.com/be5invis/Iosevka/releases/download/v16.1.0/ttf-iosevka-16.1.0.zip -O /tmp/ttf-iosevka.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.1/NerdFontsSymbolsOnly.zip -O /tmp/ttf-symbols.zip

unzip -q /tmp/dracula-gtk.zip -d $HOME/.themes/
mv $HOME/.themes/gtk-master $HOME/.themes/dracula-gtk 

unzip -q /tmp/dracula-icons.zip -d $HOME/.icons/
mv $HOME/.icons/dracula-icons-main $HOME/.icons/dracula-icons

unzip -q /tmp/ttf-iosevka.zip -d $HOME/.fonts/

unzip -q /tmp/ttf-symbols.zip -d /tmp/ttf-symbols/
mv /tmp/ttf-symbols/Symbols-2048-em\ Nerd\ Font\ Complete.ttf $HOME/.fonts/
