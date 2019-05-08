#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(
    bluez
    bluez-utils
)

install_pkgs "${pkgs[@]}"

systemctl enable bluetooth.service
systemctl start bluetooth.service
