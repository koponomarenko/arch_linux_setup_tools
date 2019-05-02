#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(
    # screen vs tmux?
    # tree
    # zathura
    # neofetch
    # gnupg
    # ranger
)

install_pkgs "${pkgs[@]}"
