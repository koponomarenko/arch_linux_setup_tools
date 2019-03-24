#!/bin/bash
. functions.sh

pkgs=(firefox)

. common_install_and_configure.sh

install_pkgs

alias_dest_file="${user_dir}/.bashrc"
firefox_wl_alias='alias firefox-wl="GDK_BACKEND=wayland firefox"'
if ! grep -q "${firefox_wl_alias}" ${alias_dest_file}; then
    cmd_do 'cat >>${alias_dest_file} <<EOF

${firefox_wl_alias}

EOF'
fi
