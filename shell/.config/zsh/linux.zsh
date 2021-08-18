#!/usr/bin/env zsh

if [[ ! "$SSH_AUTH_SOCK" ]]; then
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.sock"
fi

if command -v xsecurelock > /dev/null; then
    source ~/.config/xsecurelock/env.sh
fi
