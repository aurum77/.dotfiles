flatpak install -y --noninteractive flathub net.lutris.Lutris
flatpak install -y --noninteractive flathub com.heroicgameslauncher.hgl
flatpak install -y --noninteractive flathub com.valvesoftware.Steam
flatpak install -y --noninteractive flathub org.deluge_torrent.deluge
flatpak install -y --noninteractive flathub io.dbeaver.DBeaverCommunity
flatpak install -y --noninteractive flathub org.freedesktop.Platform.VulkanLayer.MangoHud 23.08
flatpak install -y --noninteractive flathub org.freedesktop.Platform.VulkanLayer.MangoHud 25.08
flatpak install -y --noninteractive flathub dev.vencord.Vesktop

flatpak override --user --filesystem=$HOME/.themes/
flatpak override --user --filesystem=$HOME/.icons/

flatpak override --user --nofilesystem=$HOME/Games/Heroic com.heroicgameslauncher.hgl
flatpak override --user --filesystem=$HOME/games/heroic:create com.heroicgameslauncher.hgl

flatpak override --user --filesystem=xdg-config/MangoHud:ro
