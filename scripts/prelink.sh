#!/bin/bash -e

# Ensure file symlinks
ENSURE_FILE_LINKS=(
    ~/.config/coc/extensions/
    ~/.local/bin/
)

for dir in "${ENSURE_FILE_LINKS[@]}"; do
    mkdir -p $dir
done

# Ensure directory symlinks
ENSURE_DIR_LINKS=(
    ~/.config/iterm2
    ~/.config/karabiner
    ~/.config/zsh
)

DIR_LINK_ERROR=0
for dir in "${ENSURE_DIR_LINKS[@]}"; do
    if [[ -d $dir ]]; then
        echo "Error: Directory \"$dir\" must be empty."
        DIR_LINK_ERROR=1
    fi
done

if [[ ! $DIR_LINK_ERROR == "0" ]]; then
    exit 1
fi