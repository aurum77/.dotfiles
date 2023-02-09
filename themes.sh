echo "Clearing folders"
rm -rf ~/.icons/
rm -rf ~/.themes/
rm -rf ~/.fonts/

echo "Creating folders"
mkdir $HOME/.icons/
mkdir $HOME/.themes/
mkdir $HOME/.fonts/

# Get themes
echo "Getting themes"
wget -q --show-progress $(curl -s https://api.github.com/repos/catppuccin/gtk/releases/latest |  jq --raw-output '.assets[] | select(.name | test("^(Catppuccin-Frappe-Standard-Sapphire-Dark).zip$")) .browser_download_url') -O /tmp/catppuccin-frappe-sapphire.zip
wget -q --show-progress $(curl -s https://api.github.com/repos/PapirusDevelopmentTeam/papirus-icon-theme/releases/latest |  jq --raw-output '.zipball_url') -O /tmp/papirus-icon-theme.zip
git clone https://github.com/catppuccin/papirus-folders.git /tmp/catppuccin-folder-colors


# Get the latest fonts
echo "Getting fonts"
wget -q --show-progress $(curl -s https://api.github.com/repos/be5invis/Iosevka/releases/latest |  jq --raw-output '.assets[] | select(.name | test("^(ttf-iosevka)-\\d+\\.\\d\\.\\d\\.zip$")) .browser_download_url') -O /tmp/ttf-iosevka.zip
wget -q --show-progress $(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest |  jq --raw-output '.assets[] | select(.name | test("^(NerdFontsSymbolsOnly).zip$")) .browser_download_url') -O /tmp/ttf-symbols.zip
git clone https://github.com/Templarian/MaterialDesign-Font /tmp/material-fonts

echo "Installing themes"
unzip -q -o /tmp/catppuccin-frappe-sapphire.zip -d $HOME/.themes/
unzip -q -o /tmp/papirus-icon-theme.zip -d /tmp/
mv /tmp/PapirusDevelopmentTeam-papirus-icon-theme*/Papirus-Dark $HOME/.icons/
mv /tmp/PapirusDevelopmentTeam-papirus-icon-theme*/Papirus $HOME/.icons/
cp -r /tmp/catppuccin-folder-colors/src/* $HOME/.icons/Papirus
mv /tmp/catppuccin-folder-colors/papirus-folders $HOME/.icons/Papirus
$HOME/.icons/Papirus/papirus-folders -C cat-frappe-sapphire


echo "Installing fonts"
unzip -q /tmp/ttf-iosevka.zip -d $HOME/.fonts/
unzip -q /tmp/ttf-symbols.zip -d /tmp/ttf-symbols/
mv /tmp/ttf-symbols/Symbols-2048-em\ Nerd\ Font\ Complete.ttf $HOME/.fonts/
mv /tmp/material-fonts/MaterialDesignIconsDesktop.ttf $HOME/.fonts/
