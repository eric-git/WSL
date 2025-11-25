echo "========== set Microsoft repo =========="
sudo apt-get install -y wget
source /etc/os-release
wget -q "https://packages.microsoft.com/config/debian/$VERSION_ID/packages-microsoft-prod.deb"
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell # when it's on move to below section

echo "========== install packages =========="
sudo apt-get install -y \
     curl unzip screenfetch gnome-themes-extra xterm \
     git dotnet-sdk-10.0 chromium \
     apache2 php libapache2-mod-php
INIT_LINE='export GTK_THEME=Adwaita:dark GDK_BACKEND=x11 PATH=$PATH:~/.local/bin'
eval "$INIT_LINE"
curl -s https://ohmyposh.dev/install.sh | bash -s
oh-my-posh font install meslo

echo "========== setup system =========="
sudo systemctl restart apache2
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
