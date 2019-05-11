#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(
    mako # A lightweight Wayland notification daemon
)

install_pkgs "${pkgs[@]}"
