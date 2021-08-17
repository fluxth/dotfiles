#!/bin/bash -e

PACKAGES=(
    jq
    tree
    neofetch
    mpv
    brave-bin
    spotify
    keepassxc
)

echo "Installing extra packages using yay..."
yay --needed --noconfirm -S ${PACKAGES[@]}
