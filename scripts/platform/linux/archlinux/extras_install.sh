#!/bin/bash -e

PACKAGES=(
    jq
    tree
    neofetch
    mpv
)

echo "Installing extra packages using yay..."
yay --needed --noconfirm -S ${PACKAGES[@]}
