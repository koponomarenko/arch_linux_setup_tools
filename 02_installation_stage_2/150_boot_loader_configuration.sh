#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install.sh

pkgs=(
    grub
    efibootmgr
)

install_pkgs "${pkgs[@]}"

cmd_do grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
cmd_do grub-mkconfig -o /boot/grub/grub.cfg
