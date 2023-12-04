# Get the latest fonts
echo "Getting nerd fonts"
wget -q --show-progress $(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest |  jq --raw-output '.assets[] | select(.name | test("^(NerdFontsSymbolsOnly).zip$")) .browser_download_url') -O /tmp/ttf-symbols.zip

echo "Installing fonts"
unzip -q /tmp/ttf-symbols.zip -d /tmp/ttf-symbols/
mv /tmp/ttf-symbols/SymbolsNerdFont-Regular.ttf $HOME/.fonts/
