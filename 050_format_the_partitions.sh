#!/bin/bash
. common_helpers/functions.sh

if [ -z "${1}" ]; then
    log_err "What disk (/dev/sdX) to use for the system?"
    exit 1
fi

# ${1} == /dev/sda
disk="${1}"

# EFI system partition
cmd_do mkfs.fat -F32 ${disk}1

# root
cmd_do mkfs.ext4 ${disk}2
