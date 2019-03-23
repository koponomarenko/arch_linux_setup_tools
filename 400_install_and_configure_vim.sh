#!/bin/bash
. functions.sh

pkgs=(vim)

. common_install_and_configure.sh

install_pkgs
copy_config_file "${config_dir}/.vimrc" "${user_dir}/.vimrc"
