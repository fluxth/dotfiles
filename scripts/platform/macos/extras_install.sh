#!/bin/bash -e

PACKAGES=(
    jq
    tree
    neofetch
)

echo "Installing extra packages using Homebrew..."
brew install ${PACKAGES[@]}
