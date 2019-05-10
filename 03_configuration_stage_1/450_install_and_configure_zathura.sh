#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(
    zathura
    zathura-djvu
    zathura-pdf-mupdf

    zathura-ps
    zathura-cb
)

install_pkgs "${pkgs[@]}"

mk_dest_config_dir "${user_config_dir}/zathura"
copy_config_file "${config_dir}/zathura/zathurarc" "${user_config_dir}/zathura/zathurarc"
