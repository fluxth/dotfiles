#!/bin/bash -e

PACKAGES=(
    jq
    tree
    neofetch
    mpv
)

echo "Installing extra packages using Homebrew..."
brew install ${PACKAGES[@]}
