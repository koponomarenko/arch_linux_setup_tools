#!/bin/bash
. functions.sh
. packages.sh

cmd_do pacman -Syu --noconfirm --needed ${other_pkgs[@]}
