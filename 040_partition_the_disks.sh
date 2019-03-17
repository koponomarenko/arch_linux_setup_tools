#!/bin/bash
. functions.sh

# Layout:
# /boot      /dev/sda1   fat32   550 MiB
# /          /dev/sda2   ext4    Rest of the space

if [ -z "${1}" ]; then
    log_err "What disk (/dev/sdX) to use for the system?"
    exit 1
fi

# ${1} == /dev/sda
disk="${1}"

# GPT
cmd_do parted ${disk} mklabel gpt

# /efi (/boot, /boot/efi)
cmd_do parted ${disk} mkpart primary fat32 1MiB 551MiB
cmd_do parted ${disk} set 1 esp on

# /root
cmd_do parted ${disk} mkpart primary ext4 551MiB 100%
