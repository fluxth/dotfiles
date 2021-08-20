#!/bin/bash -e

PACKAGES=(
    jq
    tree
    neofetch
    mpv
    brave-bin
    spotify
    keepassxc
    ttf-ms-fonts
    jack2
    jack2-dbus
)

echo "Installing extra packages using yay..."
yay --needed --noconfirm -S ${PACKAGES[@]}
