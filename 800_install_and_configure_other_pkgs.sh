#!/bin/bash
. common_helpers/functions.sh

pkgs=(
    # screen vs tmux?
    # tree
    # feh
    # zathura
    neofetch
    gnupg
    openssh
)

. common_helpers/common_install_and_configure.sh

install_pkgs
