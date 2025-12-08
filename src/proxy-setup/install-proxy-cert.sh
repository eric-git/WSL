#!/usr/bin/env bash
set -euo pipefail

echo "========== set proxy certificate =========="
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CERT_FILE="$SCRIPT_DIR/proxy-cert.pem"
NSS_DB="$HOME/.pki/nssdb"
CA_CERT_DIR="/usr/local/share/ca-certificates"
sudo apt-get -y install ca-certificates
sudo mkdir -p "$CA_CERT_DIR"
sudo install -m 0644 "$CERT_FILE" "$CA_CERT_DIR/proxy-cert.crt"
sudo update-ca-certificates
if command -v chromium >/dev/null 2>&1; then
    sudo apt-get install -y libnss3-tools
    mkdir -p "$NSS_DB"
    if [ ! -f "$NSS_DB/cert9.db" ]; then
        certutil -d sql:"$NSS_DB" -N --empty-password
    fi
    if ! certutil -d sql:"$NSS_DB" -L | grep -q "ProxyCert"; then
        certutil -d sql:"$NSS_DB" -A -t "C,," -n "ProxyCert" -i "$CERT_FILE"
    fi
fi
