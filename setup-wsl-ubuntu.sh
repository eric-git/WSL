echo "========== set Microsoft repo =========="
sudo apt-get install -y wget apt-transport-https software-properties-common
wget -q https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y dotnet-sdk-10.0 # when it's on move to below section

echo "========== set Firefox PPA =========="
sudo add-apt-repository -y ppa:mozillateam/ppa
PREF_FILE="/etc/apt/preferences.d/mozillateam-firefox.pref"
sudo mkdir -p /etc/apt/preferences.d
TMP_FILE=$(mktemp)
cat <<'EOF' > "$TMP_FILE"
Package: firefox*
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 501
EOF
sudo mv "$TMP_FILE" "$PREF_FILE"

echo "========== install packages =========="
sudo apt-get update
sudo apt-get -y install \
     curl unzip screenfetch gnome-themes-extra \
     powershell \
     gnome-keyring xdg-desktop-portal xdg-desktop-portal-gtk libpci3 pciutils ffmpeg libavcodec-extra firefox \
     apache2 php libapache2-mod-php
INIT_LINE='export GTK_THEME=Adwaita:dark GDK_BACKEND=x11 PATH=$PATH:~/.local/bin'
eval "$INIT_LINE"
curl -s https://ohmyposh.dev/install.sh | bash -s
oh-my-posh font install meslo

echo "========== setup system =========="
sudo systemctl restart apache2
systemctl --user add-wants default.target gnome-keyring-daemon.service xdg-desktop-portal.service
systemctl --user enable --now gnome-keyring-daemon.service xdg-desktop-portal.service
systemctl --user start gnome-keyring-daemon xdg-desktop-portal
file=~/.profile
grep -Fxq "$INIT_LINE" "$file" || echo "$INIT_LINE" >> "$file"
INIT_LINE='eval "$(~/.local/bin/oh-my-posh init bash --config ~/.cache/oh-my-posh/themes/montys.omp.json)"'
file=~/.bashrc
grep -Fxq "$INIT_LINE" "$file" || echo "$INIT_LINE" >> "$file"

echo "========== upgrade system =========="
sudo apt-get -y upgrade
sudo apt-get -y autoclean
sudo apt-get -y autoremove --purge

echo "========== setup git =========="
git config --global user.email "wu_yuqing@hotmail.com"
git config --global user.name "Eric Wu"
git config --global push.autoSetupRemote true
git config --global fetch.prune true
git config --global advice.skippedCherryPicks false
