#!/bin/bash -e

PACKAGES=(
    bspwm
    sxhkd
    rofi
    picom
    dunst
    nitrogen
    polybar
    playerctl
    xorg-xrandr
    xorg-xsetroot
    apple-fonts
)

yay --needed --noconfirm -S ${PACKAGES[@]}
