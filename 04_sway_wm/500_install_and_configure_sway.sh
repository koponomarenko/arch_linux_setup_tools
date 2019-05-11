#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(
    sway # Window Manager on Wayland
)

install_pkgs "${pkgs[@]}"

mk_dest_config_dir ${user_config_dir}/sway
mk_dest_config_dir ${user_config_dir}/sway/config.d

copy_config_file "${sway_wm_config_dir}/sway/config" "${user_config_dir}/sway/config"
copy_config_file "${sway_wm_config_dir}/sway/config.d/main_custom_config" "${user_config_dir}/sway/config.d/main_custom_config"
