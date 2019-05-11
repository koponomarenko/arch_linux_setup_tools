#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(
    grim # Screenshot utility that works under Wayland
    slurp # Select a region in a Wayland compositor (works with grim)
)

install_pkgs "${pkgs[@]}"
