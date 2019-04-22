#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(git)

install_pkgs "${pkgs[@]}"

dest_config_dir="${user_config_dir}/git"
mk_dest_config_dir "${dest_config_dir}"
copy_config_file "${config_dir}/git/config" "${dest_config_dir}/config"

# validate the config file
cmd_do git config --list --file "${dest_config_dir}/config"
