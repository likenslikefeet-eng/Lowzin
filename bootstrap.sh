#!/bin/bash
# Lowzin Linux Bootstrap Script
# Sets up minimal base with Funtoo/Gentoo userland

set -e

echo "Welcome to Lowzin Linux bootstrapper."
echo "THIS SCRIPT IS PROOF OF CONCEPT. DO NOT RUN AS-IS ON YOUR MAIN SYSTEM."

# Variables (customize as needed)
INSTALL_DIR="/opt/lowzin-root"
DOWNLOADS="$INSTALL_DIR/downloads"
FUNTOO_STAGE3_URL="https://build.funtoo.org/next/x86-64bit/generic_64/2024-*.tar.xz"

# 1. Prepare directory
sudo mkdir -p "$INSTALL_DIR" "$DOWNLOADS"
sudo chown $(whoami): "$INSTALL_DIR" "$DOWNLOADS"

# 2. Download Funtoo stage3 tarball if not already present
if [ ! -f "$DOWNLOADS/stage3.tar.xz" ]; then
  echo "Downloading Funtoo stage3..."
  curl -L $(curl -s https://build.funtoo.org/next/x86-64bit/generic_64/builds/latest | grep -o 'https://[^\"]*stage3[^\"]*\.tar\.xz' | head -1) -o "$DOWNLOADS/stage3.tar.xz"
else
  echo "Stage3 tarball already downloaded."
fi

# 3. Extract Funtoo userland
echo "Extracting Funtoo stage3..."
sudo tar -xJpf "$DOWNLOADS/stage3.tar.xz" -C "$INSTALL_DIR" --xattrs-include='*.*' --numeric-owner

echo "Funtoo userland extracted to $INSTALL_DIR"

echo "Bootstrap phase complete. Chroot into $INSTALL_DIR for further setup."
echo "Example: sudo chroot $INSTALL_DIR /bin/bash"
