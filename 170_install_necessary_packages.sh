#!/bin/bash
. common_helpers/functions.sh

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

. common_helpers/common_install_and_configure.sh

install_pkgs
