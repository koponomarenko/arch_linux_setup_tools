#!/bin/bash

. ${root_dir}/common_helpers/functions.sh

# TODO: maybe set "${print_pkgs}" as an environment variable.
install_pkgs() {
    local pkgs=("$@")
    [[ "${print_pkgs}" == "yes" ]] && { echo ${pkgs[@]}; exit 0; }
    cmd_do pacman -Syu --noconfirm --needed ${pkgs[@]}
}
