#!/bin/bash
. ../functions.sh

pkgs=(
    linux-headers # needed for *-dkms
    broadcom-wl-dkms
)


. ../common_install_and_configure.sh

install_pkgs
