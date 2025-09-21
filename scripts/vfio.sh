echo "Adding boot entry with dGPU isolated"
sudo sed -i 's/^MODULES=()/MODULES=(vfio_pci vfio vfio_iommu_type1)/' /etc/mkinitcpio.conf
sudo mkinitcpio -P linux
sudo cp "$(ls /boot/loader/entries/*linux.conf | head -n1)" /boot/loader/entries/linux-vfio.conf
sudo sed -i '$ s/$/ vfio-pci.ids=10de:28a1,10de:22be/' /boot/loader/entries/linux-vfio.conf
