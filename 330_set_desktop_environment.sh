#!/bin/bash
. functions.sh
. packages.sh

# GNOME desktop environment 
cmd_do pacman -Syu --noconfirm --needed ${gui_pkgs[@]}
cmd_do systemctl enable gdm.service
