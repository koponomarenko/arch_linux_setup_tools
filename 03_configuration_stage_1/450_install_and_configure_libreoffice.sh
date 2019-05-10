#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(libreoffice-fresh)

install_pkgs "${pkgs[@]}"
