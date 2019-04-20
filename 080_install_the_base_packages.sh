#!/bin/bash
. fcommon_helpers/unctions.sh

base_pkgs=(
    base
)

cmd_do pacstrap /mnt ${base_pkgs[@]}
