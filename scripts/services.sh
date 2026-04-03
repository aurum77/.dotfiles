echo "Setting up docker"
sudo systemctl enable --now docker.service
sudo systemctl enable --now docker.socket
sudo usermod -aG docker $USER

sudo usermod -aG gamemode $USER
