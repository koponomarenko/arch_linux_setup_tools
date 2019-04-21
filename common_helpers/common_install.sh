#!/bin/bash
. functions.sh

install_these_pkgs() {
    local pkgs=("$@")
    cmd_do pacman -Syu --noconfirm --needed ${pkgs[@]}
}
