#!/bin/bash
#
# Oleg Smirnov <oleg.smirnov.1988@gmail.com>
#


# fdisk /dev/the_disk_to_be_partitioned
# mkfs.ext4 /dev/root_partition
# mkswap /dev/swap_partition
# mount /dev/root_partition /mnt
# swapon /dev/swap_partition

fdisk /dev/sda
mkfs.ext4 /dev/sda1
mkswap /dev/sda2
mount /dev/sda1 /mnt
swapon /dev/sda2


useradd -m stealth
passwd stealth

pacman -S vim
