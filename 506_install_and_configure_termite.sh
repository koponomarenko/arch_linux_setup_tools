#!/bin/bash
. functions.sh

pkgs=(termite)

. common_install_and_configure.sh

install_pkgs
copy_config_file "${config_dir}/termite/config" "${user_config_dir}/termite/config"
