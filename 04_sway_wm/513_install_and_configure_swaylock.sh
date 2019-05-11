#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(swaylock)

install_pkgs "${pkgs[@]}"

mk_dest_config_dir ${user_config_dir}/swaylock
copy_config_file "${sway_wm_config_dir}/swaylock/config" "${user_config_dir}/swaylock/config"
mkdir -p /opt/images/
cp ${root_dir}/images/* /opt/images/.
