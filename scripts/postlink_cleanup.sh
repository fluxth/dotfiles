#!/bin/bash -e

# Install rust packages
rustup toolchain install stable
cargo install exa

# Link youtube-dl into mpv directory
ln -s $(which youtube-dl) ~/.config/mpv/youtube-dl

# Install neovim prerequisites
pip3 install neovim

cd ~/.config/coc/extensions && npm i
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim -u ~/.config/nvim/lua/plugins.lua --noplugin -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
