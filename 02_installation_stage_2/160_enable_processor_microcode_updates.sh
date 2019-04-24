#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install.sh

if cat /proc/cpuinfo | grep -q AMD; then
    cpu_manufacturer="amd"
elif cat /proc/cpuinfo | grep -q Intel; then
    cpu_manufacturer="intel"
fi

if [ -z "${cpu_manufacturer}" ]; then
    log_err "A processor manufacturer is not set!"
    log_err "Set it with \"export cpu_manufacturer=<amd|intel>\""
    exit 1
fi

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
