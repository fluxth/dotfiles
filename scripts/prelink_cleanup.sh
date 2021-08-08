#!/bin/bash -e

# Install oh-my-zsh
chsh -s $(which zsh) $(whoami)

if [[ -f "$HOME/.zshrc" ]]; then
    echo "Error: Existing ~/.zshrc found, please check and delete it before continuing."
    exit 1
fi

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --keep-zshrc --unattended"
rm ~/.zshrc