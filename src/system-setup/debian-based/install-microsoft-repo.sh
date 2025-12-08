#!/usr/bin/env bash
set -euo pipefail

echo "========== install Microsoft software =========="
sudo apt-get install -y wget apt-transport-https
source /etc/os-release
url="https://packages.microsoft.com/config/$ID/$VERSION_ID/packages-microsoft-prod.deb"
tmp=$(mktemp)
wget -qO "$tmp" "$url"
sudo dpkg -i "$tmp"
rm -f "$tmp"
sudo apt-get update
