#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(termite)

install_pkgs "${pkgs[@]}"

main_custom_config ${user_config_dir}/termite
mk_dest_config_dir ${user_config_dir}/termite
copy_config_file "${sway_wm_config_dir}/termite/config" "${user_config_dir}/termite/config"
