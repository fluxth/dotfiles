# Full control over $PATH!
# Delete the following block if it causes problems.
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin
unset HOMEBREW_SHELLENV_PREFIX
unset MANPATH
unset INFOPATH

if [[ "$ENV_ARCH" == "arm64" ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
else
    local shellenv_ret=$(/usr/local/bin/brew shellenv)
    eval "$shellenv_ret"
    if [[ -f "/opt/homebrew/bin/brew" ]] && [[ ! -z "$shellenv_ret" ]]; then
        export PATH="$PATH:/opt/homebrew/bin:/opt/homebrew/sbin";
        export MANPATH="$MANPATH:/opt/homebrew/share/man";
        export INFOPATH="$INFOPATH:/opt/homebrew/share/info";
    fi
fi

export PATH=$HOMEBREW_PREFIX/opt/llvm/bin:$HOMEBREW_PREFIX/opt/libpq/bin:$PATH

alias xdg-open=open
