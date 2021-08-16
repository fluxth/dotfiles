#!/bin/bash -e

PACKAGES=(
    bspwm
    sxhkd
    rofi
    picom
    nitrogen
    polybar
    xorg-xrandr
    xorg-xsetroot
)

yay --needed --noconfirm -S ${PACKAGES[@]}
