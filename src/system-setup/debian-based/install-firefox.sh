#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/lib.sh"

echo "========== install Firefox =========="
sudo add-apt-repository -y ppa:mozillateam/ppa
sudo mkdir -p /etc/apt/preferences.d
echo "Package: firefox*
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 501" | sudo tee /etc/apt/preferences.d/mozillateam-firefox.pref
sudo apt-get update
sudo apt-get -y install gnome-keyring xdg-desktop-portal xdg-desktop-portal-gtk libpci3 pciutils ffmpeg libavcodec-extra firefox
systemctl --user add-wants default.target gnome-keyring-daemon.service xdg-desktop-portal.service
systemctl --user enable --now gnome-keyring-daemon.service xdg-desktop-portal.service
systemctl --user start gnome-keyring-daemon xdg-desktop-portal
