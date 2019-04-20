#!/bin/bash
. common_helpers/functions.sh

pkgs=(
    sway # Window Manager on Wayland

    swaylock
    swayidle

    

    mako # A lightweight Wayland notification daemon

    grim # Screenshot utility that works under Wayland
    slurp # Select a region in a Wayland compositor (works with grim)

    light # Program to easily change brightness on backlight-controllers.

    feh # Fast and light imlib2-based image viewer
    imv # Wayland command line image viewer intended for use with tiling window managers

    pulseaudio # A featureful, general-purpose sound server.
    pavucontrol # Simple GTK+ volume control tool ("mixer") for PulseAudio.
)


. common_helpers/common_install_and_configure.sh

install_pkgs
copy_config_file "${config_dir}/sway/config" "${user_config_dir}/sway/config"

copy_config_file "${config_dir}/swaylock/config" "${user_config_dir}/swaylock/config"
mkdir -p /opt/images/
cp images/* /opt/images/.
