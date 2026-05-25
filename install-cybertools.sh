#!/bin/bash
# Installs basic cybersecurity tools for Lowzin Linux

set -e

echo "Installing cybersecurity tools..."

CYBER_PKGS="nmap wireshark aircrack-ng john hydra tcpdump hashcat openssl gnupg lynis"

if [ -x /usr/bin/emerge ]; then
  sudo emerge $CYBER_PKGS
elif [ -x /usr/bin/pacman ]; then
  sudo pacman -S --needed $CYBER_PKGS
elif [ -x /sbin/apk ]; then
  sudo apk add $CYBER_PKGS
else
  echo "Unsupported package manager. Please install tools manually."
  exit 1
fi

echo "Cybersecurity tools installed."
