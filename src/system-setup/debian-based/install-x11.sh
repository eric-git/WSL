#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/lib.sh"

echo "========== install X11 =========="
sudo apt-get -y install x11-xserver-utils
append_once \
     'export GTK_THEME=Adwaita:dark GDK_BACKEND=x11' \
     ~/.profile
