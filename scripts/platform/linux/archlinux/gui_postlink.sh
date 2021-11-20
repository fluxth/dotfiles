#!/bin/bash -e

PACKAGES=(
    bspwm
    sxhkd
    rofi
    picom
    dunst
    nitrogen
    polybar
    pulseaudio-control
    thunar
    playerctl
    pamixer
    brightnessctl
    network-manager-applet
    tumbler
    ffmpegthumbnailer
    redshift
    xss-lock
    xsecurelock
    xorg-xrandr
    xorg-xsetroot
    arandr
    apple-fonts
    noto-fonts-emoji
    noto-fonts-cjk
    noto-fonts
)

yay --needed --noconfirm -S ${PACKAGES[@]}
