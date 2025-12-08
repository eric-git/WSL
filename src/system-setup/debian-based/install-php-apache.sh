#!/usr/bin/env bash
set -euo pipefail

echo "========== install PHP & Apache =========="
sudo apt-get -y install apache2 php libapache2-mod-php
sudo systemctl restart apache2
