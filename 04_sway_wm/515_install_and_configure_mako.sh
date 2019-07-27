#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(
    libnotify  # Library for sending desktop notifications
    mako  # A lightweight Wayland notification daemon
)

install_pkgs "${pkgs[@]}"

mk_dest_config_dir ${user_config_dir}/mako
copy_config_file "${sway_wm_config_dir}/mako/config" "${user_config_dir}/mako/config"
