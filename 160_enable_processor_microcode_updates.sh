#!/bin/bash
. functions.sh

if [ -z "${1}" ]; then
    log_err "Who is the processor manufacturer for a CPU on this system?"
    exit 1
fi

# ${1} == intel
cpu_manufacturer="${1}"

# Assume GRUB boot loader
cmd_do pacman -Qi grub >/dev/null

if [[ "${cpu_manufacturer}" == "intel" ]]; then
    # Install microcode updates for intel cpu
    cmd_do pacman -Syu --noconfirm intel-ucode
else
    log_err "Unknown processor manufacturer"
    exit 1
fi

# Enable microcode updates for intel cpu
cmd_do grub-mkconfig -o /boot/grub/grub.cfg
