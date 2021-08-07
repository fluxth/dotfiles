#!/bin/bash -e

PACKAGES=(
    bspwm
    sxhkd
    dmenu
    picom
    nitrogen
    polybar
    xorg-xrandr
    xorg-xsetroot
)

yay --noconfirm -S ${PACKAGES[@]}
