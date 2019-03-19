#!/bin/bash
. functions.sh
. packages.sh

cmd_do pacman -Syu --noconfirm --needed ${necessary_pkgs[@]}
