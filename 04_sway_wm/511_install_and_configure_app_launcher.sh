#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(
    fzf # needed for the termite-based "app launcher"
)

install_pkgs "${pkgs[@]}"

# Configure app launcher
sway_app_launcher="/usr/local/bin/sway_app_launcher"
cmd_do cp ${root_dir}/tools/sway_app_launcher ${sway_app_launcher}
cmd_do chmod +x ${sway_app_launcher}
