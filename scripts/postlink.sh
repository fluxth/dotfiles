#!/bin/bash -e

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

# Install p10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install zsh plugins, called from makefile directory
$CURRENT_DIR/misc/zsh_install_plugins.sh

# Install tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm