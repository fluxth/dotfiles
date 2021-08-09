#!/bin/bash -e

PACKAGES=(
    nvim
    ripgrep
    alacritty
    mpv
    zsh
    tmux
    rustup-init
    node
    youtube-dl
)

CASK_PACKAGES=(
    font-meslo-lg-nerd-font
)

echo "Installing packages..."
brew install ${PACKAGES[@]}
brew install --cask ${CASK_PACKAGES[@]}
