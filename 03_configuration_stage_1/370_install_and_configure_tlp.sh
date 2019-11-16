#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(
    tlp
    tlp-rdw # NetworkManager is required for this one
)

install_pkgs "${pkgs[@]}"

systemctl enable tlp.service
systemctl start tlp.service

systemctl enable tlp-sleep.service

systemctl enable NetworkManager-dispatcher.service

systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket
