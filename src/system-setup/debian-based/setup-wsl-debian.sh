#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
. "$(dirname "$0")/install-microsoft-repo.sh"
. "$(dirname "$0")/install-screenfetch.sh"
. "$(dirname "$0")/install-git.sh"
. "$(dirname "$0")/install-php-apache.sh"
. "$(dirname "$0")/install-x11.sh"
. "$(dirname "$0")/install-chromium.sh"
. "$(dirname "$0")/install-oh-my-posh.sh"
# . "$(dirname "$0")/install-xterm.sh"
. "$(dirname "$0")/install-dotnet-sdk.sh"
# . "$(dirname "$0")/install-powershell.sh"
. "$(dirname "$0")/upgrade-system.sh"
