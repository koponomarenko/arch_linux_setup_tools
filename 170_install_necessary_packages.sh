#!/bin/bash
. functions.sh

pkgs=(
    pkgstats  # Submit a list of installed packages to the Arch Linux project
    pacman-contrib  # Contributed scripts and tools for pacman systems
    base-devel
    bash-completion
    vim
    sudo

    python
    python2

    parted
)

cmd_do pacman -Syu --noconfirm --needed ${pkgs[@]}
