#!/bin/bash

base_pkgs=(
    base
)

network_pkgs=(
    networkmanager
)

boot_loader_pkgs=(
    grub
    efibootmgr
)

intel_microcode_pkgs=(
    intel-ucode
)

necessary_pkgs=(
    pkgstats  # Submit a list of installed packages to the Arch Linux project
    pacman-contrib  # Contributed scripts and tools for pacman systems
    bash-completion
    vim
    sudo
    base-devel

    python
    python2

    parted
)

gui_pkgs=(
    gnome
)

other_pkgs=(
    firefox
    qtcreator
)

fonts_pkgs=(
)

printer_pkgs=(
    cups
    samba  # for shared printers
)
