#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "$0")/lib.sh"

echo "========== install XTerm =========="
sudo apt-get -y install xterm
font="MesloLGM Nerd Font"
if fc-list : family | grep -Fx "$font"; then
    append_once \
        "XTerm*faceName: $font" \
        "XTerm*faceSize: 10" \
        "XTerm*background: black" \
        "XTerm*foreground: lightgray" \
        ~/.Xresources
    append_once \
        '[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources' \
        ~/.bashrc
fi
