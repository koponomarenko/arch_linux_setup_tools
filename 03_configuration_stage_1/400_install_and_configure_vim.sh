#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(vim)

install_pkgs "${pkgs[@]}"
copy_config_file "${config_dir}/vim/vimrc" "${user_dir}/.vimrc"

# Color scheme
mk_dest_config_dir "${user_dir}/.vim"
mk_dest_config_dir "${user_dir}/.vim/colors"
copy_config_file "${config_dir}/vim/colors/solarized.vim" "${user_dir}/.vim/colors/solarized.vim"
