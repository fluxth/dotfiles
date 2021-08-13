#!/bin/bash -e

PACKAGES=(
    nvim
    ripgrep
    alacritty
    zsh
    tmux
    rustup-init
    node
    youtube-dl
    exa
)

CASK_PACKAGES=(
    font-meslo-lg-nerd-font
)

brew install ${PACKAGES[@]}
brew install --cask ${CASK_PACKAGES[@]}
