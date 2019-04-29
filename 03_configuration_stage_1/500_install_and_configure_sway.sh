#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

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

install_pkgs "${pkgs[@]}"

mk_dest_config_dir ${config_dir}/sway
copy_config_file "${config_dir}/sway/config" "${user_config_dir}/sway/config"

# Configure swaylock
copy_config_file "${config_dir}/swaylock/config" "${user_config_dir}/swaylock/config"
mkdir -p /opt/images/
cp images/* /opt/images/.

# Configure app launcher
sway_app_launcher="/usr/local/bin/sway_app_launcher"
cmd_do cp tools/sway_app_launcher ${sway_app_launcher}
cmd_do chmod +x ${sway_app_launcher}
