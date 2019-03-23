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
    sudo
    base-devel
    parted
)

python_pkgs=(python python2)
urxvt_pkgs=(rxvt-unicode)

git_pkgs=(git)
qtcreator_pkgs=(qtcreator)

other_pkgs=(
    # screen vs tmux?
    # tree
    # feh
    # zathura
    neofetch
    gnupg
    openssh
)

fonts_pkgs=(
)

printer_pkgs=(
    cups
    samba  # for shared printers
)
