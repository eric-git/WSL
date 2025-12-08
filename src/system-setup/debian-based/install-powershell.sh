#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/lib.sh"

echo "========== install PowerShell =========="
sudo apt-get install -y powershell
mkdir -p ~/.config/powershell
echo "~/.local/bin/oh-my-posh init pwsh --config ~/.cache/oh-my-posh/themes/montys.omp.json | Invoke-Expression" | sudo tee ~/.config/powershell/Microsoft.PowerShell_profile.ps1
