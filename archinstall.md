cfdisk
efi 600m
swap 1G

ip link
timedatectl
mkfs.ext4 /dev/root_partition
mkswap /dev/swap_partition
mkfs.fat -F 32 <efi partition>

mount /dev/root_partition /mnt
mount --mkdir /dev/efi_system_partition /mnt/boot
swapon /dev/swap_partition

pacstrap -K /mnt base linux linux-firmware networkmanager <+any packages i want>
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
hwclock --systohc
echo spaceaxolotl > /etc/hostname
passwd

pacman -S efibootmgr grub

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg




