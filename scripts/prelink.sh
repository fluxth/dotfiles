#!/bin/bash -e

# Ensure file symlinks
ENSURE_FILE_LINKS=(
    ~/.config/coc/extensions
    ~/.local/bin
)

for dir in "${ENSURE_FILE_LINKS[@]}"; do
    mkdir -p $dir
done

# Ensure directory symlinks
ENSURE_DIR_LINKS=(
    ~/.config/iterm2
    ~/.config/karabiner
)

for dir in "${ENSURE_DIR_LINKS[@]}"; do
    [ ! -d $dir ] || echo "Error: Directory \"$dir\" must be empty."
done
