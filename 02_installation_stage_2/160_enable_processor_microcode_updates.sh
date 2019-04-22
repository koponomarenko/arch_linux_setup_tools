#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install.sh

if [ -z "${1}" ]; then
    log_err "Who is the processor manufacturer for a CPU on this system?"
    exit 1
fi

# ${1} == intel
cpu_manufacturer="${1}"

amd_microcode_pkgs=(
    amd-ucode
)

intel_microcode_pkgs=(
    intel-ucode
)

# Assume GRUB boot loader is used, exit ERROR if not.
cmd_do pacman -Qi grub >/dev/null

if [[ "${cpu_manufacturer}" == "amd" ]]; then
    # Install microcode updates for AMD cpu
    install_pkgs "${amd_microcode_pkgs[@]}"
elif [[ "${cpu_manufacturer}" == "intel" ]]; then
    # Install microcode updates for Intel cpu
    install_pkgs "${intel_microcode_pkgs[@]}"
else
    log_err "Unknown processor manufacturer"
    exit 1
fi

# Enable microcode updates for intel cpu
cmd_do grub-mkconfig -o /boot/grub/grub.cfg
