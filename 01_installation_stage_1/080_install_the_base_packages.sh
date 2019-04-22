#!/bin/bash

. ${root_dir}/common_helpers/functions.sh

base_pkgs=(
    base
)

cmd_do pacstrap /mnt ${base_pkgs[@]}
