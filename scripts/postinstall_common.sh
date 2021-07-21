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
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
pip3 install neovim
cd ~/.config/coc/extensions && npm i
nvim +PlugInstall
