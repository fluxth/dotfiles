#!/bin/bash -e

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

# Install oh-my-zsh
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh

# Install p10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install zsh plugins, called from makefile directory
$CURRENT_DIR/misc/zsh_install_plugins.sh

# Install tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm

# Install rust packages
rustup toolchain install stable
cargo install exa

# Install neovim prerequisites
pip3 install neovim

# TODO: ALSO DELETE PREV .zshrc from omz
cd ~/.config/coc/extensions && npm i # TODO: do :CocInstall for each coc extensions
nvim -c PackerInstall
