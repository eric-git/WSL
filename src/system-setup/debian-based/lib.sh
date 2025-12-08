#!/usr/bin/env bash
set -euo pipefail

append_once() {
     local file="${!#}"
     local line
     [ -e "$file" ] || : > "$file"
     for line in "${@:1:$#-1}"; do
          grep -Fxq "$line" "$file" || echo "$line" >> "$file"
     done
}
