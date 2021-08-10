#!/bin/bash -e

PACKAGES=(
    jq
    tree
    neofetch
)

echo "Installing extra packages using yay..."
yay --needed --noconfirm -S ${PACKAGES[@]}
