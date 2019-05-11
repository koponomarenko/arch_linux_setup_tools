#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(
    imv # Wayland command line image viewer intended for use with tiling window managers
)

install_pkgs "${pkgs[@]}"
