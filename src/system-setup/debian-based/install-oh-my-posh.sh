#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/lib.sh"

echo "========== install Oh My Posh =========="
sudo apt-get install -y curl unzip
export PATH=$PATH:~/.local/bin
curl -s https://ohmyposh.dev/install.sh | bash -s
oh-my-posh font install meslo
fc-cache -fv
append_once \
     'eval "$(~/.local/bin/oh-my-posh init bash --config ~/.cache/oh-my-posh/themes/montys.omp.json)"' \
     ~/.bashrc
append_once \
     'export PATH=$PATH:~/.local/bin' \
     ~/.profile
