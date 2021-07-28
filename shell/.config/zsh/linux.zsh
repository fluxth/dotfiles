#!/bin/zsh

export PATH=$HOME/.cargo/bin:$PATH

if [[ ! "$SSH_AUTH_SOCK" ]]; then
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.sock"
fi
