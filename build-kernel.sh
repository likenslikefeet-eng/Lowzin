#!/bin/bash
# Lowzin Kernel Build Script
# Run this inside your chrooted Lowzin/Funtoo/LFS environment

set -e

KERNEL_VERSION="6.8.9"
KERNEL_ARCHIVE="linux-$KERNEL_VERSION.tar.xz"
KERNEL_URL="https://cdn.kernel.org/pub/linux/kernel/v6.x/$KERNEL_ARCHIVE"
BUILD_DIR="/usr/src"
INSTALL_PATH="/boot"

echo "Downloading Linux kernel $KERNEL_VERSION..."
cd $BUILD_DIR
if [ ! -f "$KERNEL_ARCHIVE" ]; then
    curl -LO $KERNEL_URL
fi
if [ ! -d "linux-$KERNEL_VERSION" ]; then
    tar -xf $KERNEL_ARCHIVE
fi
cd linux-$KERNEL_VERSION

echo "Launching kernel configuration (menuconfig)..."
make mrproper
make menuconfig

echo "Building the kernel (this may take a while)..."
make -j$(nproc)

echo "Installing kernel modules..."
make modules_install

echo "Copying kernel and config to $INSTALL_PATH"
cp -v arch/x86/boot/bzImage $INSTALL_PATH/vmlinuz-$KERNEL_VERSION-lowzin
cp -v .config $INSTALL_PATH/config-$KERNEL_VERSION-lowzin

echo "Kernel $KERNEL_VERSION build complete!"
echo
echo "You still need to:"
echo "- Build/install an initramfs (optional, recommended for some setups)"
echo "- Set up your bootloader (GRUB, Syslinux, etc.) to boot vmlinuz-$KERNEL_VERSION-lowzin"
echo "- Edit /etc/fstab as necessary"
