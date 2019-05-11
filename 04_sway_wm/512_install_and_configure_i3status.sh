#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(i3status)

install_pkgs "${pkgs[@]}"

mk_dest_config_dir ${user_config_dir}/i3status
copy_config_file "${sway_wm_config_dir}/i3status/config" "${user_config_dir}/i3status/config"
