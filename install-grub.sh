#!/bin/bash
# Robust, slow & safe GRUB Bootloader Install for Lowzin/Linux
# Run ONLY in chroot after kernel and /etc/fstab are ready

set -e

echo "This script will carefully install GRUB on your disk. Do NOT rush. Read every prompt!"
echo "Ensure /boot is mounted, and you are in the target chroot (not your host OS)."
read -r -p "Have you verified /boot and the root partition are correct for your target system? [y/N]: " OK1
[ "$OK1" = "y" ] || { echo "Please fix system layout, then rerun."; exit 1; }

# Install GRUB and efibootmgr if needed.
if [ -x /usr/bin/emerge ]; then
    emerge --sync && emerge sys-boot/grub sys-boot/efibootmgr
elif [ -x /usr/bin/pacman ]; then
    pacman -Sy --noconfirm grub efibootmgr
elif [ -x /sbin/apk ]; then
    apk update && apk add grub efibootmgr
else
    echo "Unknown package manager. Install GRUB and efibootmgr manually, then rerun."
    exit 1
fi

sync; sleep 2
echo
lsblk
echo
read -r -p "Enter the device for GRUB install (example: /dev/sda): " GRUBDEV
read -r -p "Final warning: This will overwrite $GRUBDEV boot sector. Continue? [y/N]: " PROCEED
[ "$PROCEED" = "y" ] || { echo "Cancelled by user."; exit 1; }
echo "Installing GRUB bootloader to $GRUBDEV... Please wait!"

grub-install "$GRUBDEV"
sync; sleep 5

echo "GRUB installed to $GRUBDEV. Listing /boot contents:"
ls -lh /boot

echo "Generating /boot/grub/grub.cfg (scanning for kernels, this may take time)..."
grub-mkconfig -o /boot/grub/grub.cfg
sync; sleep 5

echo
"Verifying /boot/grub/grub.cfg was created:"
ls -lh /boot/grub/grub.cfg
cat /boot/grub/grub.cfg | head -20
echo

echo "Syncing disks for hardware flush..."
sync; sleep 10

echo "DONE! It's recommended to: "
echo " - Double-check kernel/initramfs paths in /boot/grub/grub.cfg"
echo " - Reboot and test booting the system."
echo " - If issues, boot from live USB and re-run this script slowly!"

echo "Lowzin safe GRUB install complete."
