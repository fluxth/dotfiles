#!/bin/bash -e

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

if command -v pacman &> /dev/null; then
    echo "Distro detected as Arch Linux"
    $CURRENT_DIR/archlinux/prelink.sh
fi
