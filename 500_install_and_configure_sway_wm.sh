#!/bin/bash
. functions.sh

pkgs=(sway)

. common_install_and_configure.sh

install_pkgs
copy_config_file "${config_dir}/sway/config" "${user_config_dir}/sway/config"
