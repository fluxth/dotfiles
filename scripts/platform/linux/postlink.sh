#!/bin/bash -e

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

if command -v pacman &> /dev/null; then
    $CURRENT_DIR/archlinux/postlink.sh
fi
