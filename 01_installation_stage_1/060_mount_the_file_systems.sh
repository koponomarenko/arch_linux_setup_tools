#!/bin/bash

. ${root_dir}/common_helpers/functions.sh

if [[ ${disk} != /dev/* ]]; then
    log_err "A disk to use for the new system installation is not set!"
    log_err "Set it with \"export disk=/dev/<disk>\""
    exit 1
fi

if [[ ${disk} == /dev/nvme* ]]; then
    efi_partition="${disk}p1"
    root_partition="${disk}p2"
else
    efi_partition="${disk}1"
    root_partition="${disk}2"
fi

cmd_do mount ${root_partition} /mnt
cmd_do mkdir -p /mnt/boot
cmd_do mount ${efi_partition} /mnt/boot
