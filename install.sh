#!/bin/bash
. functions.sh

# Installation details
# --------------------
# x86_64 CPU
# Intel CPU and Intel IGP (integrated graphics).
# UEFI boot mode
# Only one system disk.
# GPT for the system disk
# No shared OS on this hardware - only one OS.
# 
# Only US English locale is used.
#
# init system: systemd
# boot loader: GRUB

while [[ $# -gt 0 ]]; do
    key="${1}"
    case ${key} in
        --sys-disk)
            system_disk="${2}"
            shift # past argument
            shift # past value
            ;;
        --hostname)
            hostname="${2}"
            shift # past argument
            shift # past value
            ;;
        --cpu-manufacturer)
            cpu_manufacturer="${2}"
            shift # past argument
            shift # past value
            ;;
        *) # unknown option
            shift # past argument
            ;;
    esac
done

[ -n "${system_disk}" ] || { log_err "'--sys-disk' must be set"; exit 1; }
[ -n "${hostname}" ] || { log_err "'--hostname' must be set"; exit 1; }
[ -n "${cpu_manufacturer}" ] || { log_err "'--cpu-manufacturer' must be set"; exit 1; }
#TODO: maybe show general help/example on any error.

scripts=(
### basic installation
# Pre-installation
010_verify_the_boot_mode.sh
020_connect_to_the_internet.sh
030_update_the_system_clock.sh
"040_partition_the_disks.sh ${system_disk}"
"050_format_the_partitions.sh ${system_disk}"
"060_mount_the_file_systems.sh ${system_disk}"
# Installation
070_select_the_mirrors.sh
080_install_the_base_packages.sh
# Configure the system
090_generate_fstab.sh
100_chroot_into_the_new_system.sh
110_set_the_time_zone.sh
120_set_localization.sh
"130_network_configuration.sh ${hostname}"
140_create_initramfs.sh
150_boot_loader_configuration.sh
"160_enable_processor_microcode_updates.sh ${cpu_manufacturer}"
170_install_necessary_packages.sh
180_set_the_root_password.sh
### post-installation
)

for i in "${scripts[@]}"; do
    echo "${i}"
done
