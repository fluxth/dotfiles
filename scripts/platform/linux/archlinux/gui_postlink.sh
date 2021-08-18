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
    noto-fonts-emoji
    noto-fonts-cjk
    noto-fonts
)

yay --needed --noconfirm -S ${PACKAGES[@]}
