if [[ "$(uname)" == "Linux" ]]; then
    # You can comment this out if you're using any login managers
    if [[ "$(tty)" == "/dev/tty1" ]]; then
        if ! pgrep -x bspwm > /dev/null; then
            exec startx
            exit
        fi
    fi

    export QT_AUTO_SCREEN_SCALE_FACTOR=1.5
fi
