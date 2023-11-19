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
