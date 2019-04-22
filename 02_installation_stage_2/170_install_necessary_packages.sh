#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install.sh

pkgs=(
    pkgstats  # Submit a list of installed packages to the Arch Linux project
    pacman-contrib  # Contributed scripts and tools for pacman systems
    bash-completion
    sudo
    base-devel

    parted
    gawk
    python
    python2
)

install_pkgs "${pkgs[@]}"
