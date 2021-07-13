export ENV_ARCH=$(uname -m)
if [ "$ENV_ARCH" = "arm64" ]; then
    eval $(/opt/homebrew/bin/brew shellenv)
else
    export PATH="${PATH}${PATH:+:}/opt/homebrew/bin:/opt/homebrew/sbin";
    export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
    export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
fi
