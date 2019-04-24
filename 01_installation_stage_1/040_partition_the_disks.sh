#!/bin/bash

. ${root_dir}/common_helpers/functions.sh

# Layout:
# /boot      /dev/sda1   fat32   550 MiB
# /          /dev/sda2   ext4    Rest of the space

if [[ ${disk} != /dev/* ]]; then
    log_err "A disk to use for the new system installation is not set!"
    log_err "Set it with \"export disk=/dev/<disk>\""
    exit 1
fi

# GPT
cmd_do parted ${disk} mklabel gpt

# /efi (/boot, /boot/efi)
cmd_do parted ${disk} mkpart primary fat32 1MiB 551MiB
cmd_do parted ${disk} set 1 esp on

# /root
cmd_do parted ${disk} mkpart primary ext4 551MiB 100%
