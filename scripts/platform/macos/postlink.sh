#!/bin/bash -e

PACKAGES=(
    nvim
    alacritty
    mpv
    zsh
    tmux
    rustup-init
    node
)

CASK_PACKAGES=(
    font-meslo-lg-nerd-font
)

echo "Installing packages..."
brew install ${PACKAGES[@]}
brew install --cask ${CASK_PACKAGES[@]}
