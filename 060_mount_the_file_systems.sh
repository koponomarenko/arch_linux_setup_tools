#!/bin/bash
. common_helpers/functions.sh

if [ -z "${1}" ]; then
    log_err "What disk (/dev/sdX) to use for the system?"
    exit 1
fi

# ${1} == /dev/sda
disk="${1}"

cmd_do mount ${disk}2 /mnt
cmd_do mkdir -p /mnt/boot
cmd_do mount ${disk}1 /mnt/boot
