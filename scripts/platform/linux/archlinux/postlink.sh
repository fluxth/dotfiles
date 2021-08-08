#!/bin/bash -e

PACKAGES=(
    base-devel
    neovim
    xclip
    alacritty
    mpv
    tmux
    rustup
    nodejs
    npm
    python-pip
    ttf-meslo-nerd-font-powerlevel10k
)

yay --noconfirm --needed -S ${PACKAGES[@]}
