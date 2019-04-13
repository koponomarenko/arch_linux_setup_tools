#!/bin/bash
. functions.sh

pkgs=(
    sway
    dmenu #TODO: change for smth with Wayland support
    swaylock
    swayidle
    mako # A lightweight Wayland notification daemon

    grim # Screenshot utility that works under Wayland
    slurp # Select a region in a Wayland compositor (works with grim)

    light # Program to easily change brightness on backlight-controllers.

    feh # Fast and light imlib2-based image viewer

    pulseaudio # A featureful, general-purpose sound server.
    pavucontrol # Simple GTK+ volume control tool ("mixer") for PulseAudio.
)


. common_install_and_configure.sh

install_pkgs
copy_config_file "${config_dir}/sway/config" "${user_config_dir}/sway/config"
