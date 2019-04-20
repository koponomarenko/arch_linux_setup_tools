#!/bin/bash
. common_helpers/functions.sh

pkgs=(vim)

. common_helpers/common_install_and_configure.sh

install_pkgs
copy_config_file "${config_dir}/vim/vimrc" "${user_dir}/.vimrc"

# Color scheme
mk_dest_config_dir "${user_dir}/.vim"
mk_dest_config_dir "${user_dir}/.vim/colors"
copy_config_file "${config_dir}/vim/colors/solarized.vim" "${user_dir}/.vim/colors/solarized.vim"
