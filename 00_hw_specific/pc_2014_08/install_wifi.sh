#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(
    linux-headers # needed for *-dkms
    broadcom-wl-dkms
)

install_pkgs "${pkgs[@]}"
