#!/bin/bash
. functions.sh

pkgs=(
    sway
    dmenu #TODO: change for smth with Wayland support
    swaylock
    swayidle
)


. common_install_and_configure.sh

install_pkgs
copy_config_file "${config_dir}/sway/config" "${user_config_dir}/sway/config"
