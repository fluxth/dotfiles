#!/bin/bash -e

PACKAGES=(
    base-devel
    neovim
    ripgrep
    xclip
    alacritty
    tmux
    rustup
    nodejs
    npm
    python-pip
    youtube-dl
    ttf-meslo-nerd-font-powerlevel10k
    exa
    git-delta
    fzf
)

yay --noconfirm --needed -S ${PACKAGES[@]}
