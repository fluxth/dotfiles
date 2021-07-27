#!/bin/bash

# Install p10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install zsh plugins
./zsh_install_plugins.sh

# Install tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm

# Install rust packages
rustup toolchain install stable
cargo install exa

# Install neovim prerequisites
pip3 install neovim
cd ~/.config/coc/extensions && npm i # TODO: do :CocInstall for each coc extensions
nvim +PackerInstall
