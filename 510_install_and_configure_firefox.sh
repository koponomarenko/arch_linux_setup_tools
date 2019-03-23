#!/bin/bash
. functions.sh

pkgs=(firefox)

. common_install_and_configure.sh

install_pkgs
#TODO: configure it
#copy_config_file "${config_dir}/" "${user_dir}/."
