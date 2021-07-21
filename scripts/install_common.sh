#!/bin/bash

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Reserve directories before stow symlinks it!
mkdir -p ~/.config/coc/extensions
