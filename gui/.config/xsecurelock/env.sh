#!/bin/sh
export XSECURELOCK_PASSWORD_PROMPT=asterisks
export XSECURELOCK_COMPOSITE_OBSCURER=0

export XSECURELOCK_KEY_XF86AudioPlay_COMMAND="playerctl play-pause"
export XSECURELOCK_KEY_XF86AudioStop_COMMAND="playerctl stop"
export XSECURELOCK_KEY_XF86AudioMute_COMMAND="amixer set Master toggle"
