#! /usr/bin/bash

function kb_to_mb() {
  IN_MB=$(($1 / 1024))
}

### THIS SCRIPT IS ONLY MEANT TO RUN ONCE ###

if [ "$EUID" -ne 0 ]
  then echo "you need root for this script"
  exit
fi

# get the sum of available zram swap in bytes
zram_available=$(cat /proc/swaps | grep "zram" | awk '{ sum+=$3 } END {print sum}')

# zram compresses in a roughly 3:1 ratio
zram=$(($zram_available / 3))

kb_to_mb $zram
echo you have $IN_MB\mb of zram swap
zram_in_mb=$IN_MB

memory_available=$(cat /proc/meminfo | grep "MemTotal" | awk '{print $2}')

kb_to_mb $memory_available
echo you have $IN_MB\mb of memory
memory_in_mb=$IN_MB

swap_size_in_mb=$(($memory_in_mb + $zram_in_mb + 2048))

echo swap size will be $swap_size_in_mb\mb \(added 2gb for just in case\)

echo creating swapfile
dd if=/dev/zero of=/swapfile bs=1M count=$swap_size_in_mb status=progress

chmod 600 /swapfile
mkswap /swapfile 2>/dev/null
swapon /swapfile 2>/dev/null

swapfile_uuid=$(findmnt -no UUID -T /swapfile)
echo swap uuid is $swapfile_uuid

swap_offset=$(filefrag -v /swapfile | head -4 | tail +4 | awk {'print substr($4, 1, length($4)-2)'})
echo swap offset is $swap_offset

echo adding swap to fstab
echo '/swapfile   none    swap    defaults    0   0' | tee -a /etc/fstab 2>/dev/null

# this is rather lazy
echo adding resume hook to mkinitcpio.conf
sed -i 's/base udev/base udev resume/' /etc/mkinitcpio.conf

mkinitcpio -P linux-lts

sed -i "s/rw/resume=UUID=$swapfile_uuid resume_offset=$swap_offset rw/" /boot/loader/entries/arch.conf
