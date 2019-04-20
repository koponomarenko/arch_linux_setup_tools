#!/bin/bash
. common_helpers/functions.sh

pkgs=(
    ttf-liberation # default
    noto-fonts # Google font family, fallback fonts

    ttf-roboto
    ttf-dejavu
    ttf-ubuntu-font-family
    ttf-bitstream-vera
)

. common_helpers/common_install_and_configure.sh

install_pkgs

mk_dest_config_dir "${user_config_dir}/fontconfig"
copy_config_file "${config_dir}/fontconfig/fonts.conf" "${user_config_dir}/fontconfig/fonts.conf"

# Test font for urxvt
# urxvt -fn 'xft:DejaVu Sans Mono:size=10'
# urxvt -fn 'xft:Liberation Mono:size=10'
copy_config_file "${config_dir}/X/Xdefaults" "${user_dir}/.Xdefaults"
