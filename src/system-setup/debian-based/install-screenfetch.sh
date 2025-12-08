#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/lib.sh"

echo "========== install screenfetch =========="
sudo apt-get -y install screenfetch
append_once \
     'screenfetch' \
     ~/.bashrc
