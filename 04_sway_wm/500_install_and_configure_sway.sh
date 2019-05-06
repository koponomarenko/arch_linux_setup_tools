#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(
    sway # Window Manager on Wayland

    i3status

    swaylock
    swayidle

    fzf # needed for the termite-based "app launcher"

    mako # A lightweight Wayland notification daemon

    grim # Screenshot utility that works under Wayland
    slurp # Select a region in a Wayland compositor (works with grim)

    light # Program to easily change brightness on backlight-controllers.

    imv # Wayland command line image viewer intended for use with tiling window managers

    pulseaudio # A featureful, general-purpose sound server.
    pavucontrol # Simple GTK+ volume control tool ("mixer") for PulseAudio.
)

install_pkgs "${pkgs[@]}"

mk_dest_config_dir ${user_config_dir}/sway
mk_dest_config_dir ${user_config_dir}/sway/config.d

copy_config_file "${sway_wm_config_dir}/sway/config" "${user_config_dir}/sway/config"
copy_config_file "${sway_wm_config_dir}/sway/config.d/main_custom_config" "${user_config_dir}/sway/config.d/main_custom_config"

# Configure i3status
mk_dest_config_dir ${user_config_dir}/i3status
copy_config_file "${sway_wm_config_dir}/i3status/config" "${user_config_dir}/i3status/config"

# Configure swaylock
mk_dest_config_dir ${user_config_dir}/swaylock
copy_config_file "${sway_wm_config_dir}/swaylock/config" "${user_config_dir}/swaylock/config"
mkdir -p /opt/images/
cp ${root_dir}/images/* /opt/images/.

# Configure app launcher
sway_app_launcher="/usr/local/bin/sway_app_launcher"
cmd_do cp ${root_dir}/tools/sway_app_launcher ${sway_app_launcher}
cmd_do chmod +x ${sway_app_launcher}

# Configure screen_brightness.sh
screen_brightness="/usr/local/bin/screen_brightness.sh"
cmd_do cp ${root_dir}/tools/screen_brightness.sh ${screen_brightness}
cmd_do chmod +x ${screen_brightness}
