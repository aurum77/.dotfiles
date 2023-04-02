echo "Clearing folders"
rm -rf ~/.icons/
rm -rf ~/.themes/
rm -rf ~/.fonts/

echo "Creating folders"
mkdir $HOME/.icons/
mkdir $HOME/.themes/
mkdir $HOME/.fonts/

# Get themes
echo "Getting and installing themes"
git clone https://github.com/jmattheis/gruvbox-dark-gtk.git $HOME/.themes/gruvbox-dark-gtk
git clone https://github.com/jmattheis/gruvbox-dark-icons-gtk.git $HOME/.icons/gruvbox-dark-icons-gtk

# Get the latest fonts
echo "Getting fonts"
wget -q --show-progress $(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest |  jq --raw-output '.assets[] | select(.name | test("^(NerdFontsSymbolsOnly).zip$")) .browser_download_url') -O /tmp/ttf-symbols.zip
git clone https://github.com/Templarian/MaterialDesign-Font /tmp/material-fonts

echo "Installing fonts"
unzip -q /tmp/ttf-symbols.zip -d /tmp/ttf-symbols/
mv /tmp/ttf-symbols/Symbols-2048-em\ Nerd\ Font\ Complete.ttf $HOME/.fonts/
mv /tmp/material-fonts/MaterialDesignIconsDesktop.ttf $HOME/.fonts/
