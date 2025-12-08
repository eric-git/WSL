#!/usr/bin/env bash
set -euo pipefail

echo "========== install git =========="
sudo apt-get -y install git
git config --global user.email "wu_yuqing@hotmail.com"
git config --global user.name "Eric Wu"
git config --global push.autoSetupRemote true
git config --global fetch.prune true
git config --global advice.skippedCherryPicks false
