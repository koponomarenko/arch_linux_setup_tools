#!/bin/bash
. functions.sh

pkgs=(git)

. common_install_and_configure.sh

install_pkgs
copy_config_file "${config_dir}/.gitconfig" "${user_dir}/.gitconfig"

# validate the config file
cmd_do git config --list --file "${user_dir}/.gitconfig"
