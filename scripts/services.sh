echo "Setting up docker"
sudo systemctl enable --now docker.service
sudo systemctl enable --now docker.socket
sudo usermod -aG docker $USER

echo "Starting TLP"
sudo systemctl enable --now tlp.service

echo "Starting libvirt"
sudo systemctl enable --now libvirt.service

echo "Starting default virsh network"
sudo virsh net-start default
sudo virsh net-autostart default
