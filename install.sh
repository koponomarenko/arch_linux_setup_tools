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


show_help() {
    cat <<EOF
install.sh [basic-install|basic-config|final-config] OPTIONS

install.sh basic-install -d <system-disk>
install.sh basic-config -h <hostname> -c <cpu-manufacturer>
install.sh final-config -u <user>

OPTIONS:
-d|--sys-disk           Disk to install the system on [/dev/sdX].
-h|--hostname           Hostname for the new system.
-c|--cpu-manufacturer   CPU manufacturer [intel].
-u|--user               Username for a user on the new system.
-p|--print-pkgs         Show packages which whould be installed.
EOF
}

[ -n "${1}" ] || { show_help; exit 1; }
# get the stage - positional parameter
stage="${1}"

while [[ $# -gt 0 ]]; do
    key="${1}"
    case ${key} in
        -d|--sys-disk)
            system_disk="${2}"
            shift # past argument
            shift # past value
            ;;
        -h|--hostname)
            hostname="${2}"
            shift # past argument
            shift # past value
            ;;
        -c|--cpu-manufacturer)
            cpu_manufacturer="${2}"
            shift # past argument
            shift # past value
            ;;
        -u|--user)
            user="${2}"
            shift # past argument
            shift # past value
            ;;
        *) # unknown option
            shift # past argument
            ;;
    esac
done

scripts_dir="$(dirname $(realpath "${BASH_SOURCE[0]}"))"
config_dir="${scripts_dir}/config"

# before chroot
basic_install_scripts=(
    010_verify_the_boot_mode.sh
    020_connect_to_the_internet.sh
    030_update_the_system_clock.sh
    "040_partition_the_disks.sh ${system_disk}"
    "050_format_the_partitions.sh ${system_disk}"
    "060_mount_the_file_systems.sh ${system_disk}"
    070_select_the_mirrors.sh
    080_install_the_base_packages.sh
    090_generate_fstab.sh
    "095_copy_these_scripts_to_the_new_system.sh ${scripts_dir}"
    100_chroot_into_the_new_system.sh
)

# in chroot
basic_config_scripts=(
    110_set_the_time_zone.sh
    120_set_localization.sh
    "130_network_configuration.sh ${hostname}"
    140_create_initramfs.sh
    150_boot_loader_configuration.sh
    "160_enable_processor_microcode_updates.sh ${cpu_manufacturer}"
    170_install_necessary_packages.sh
    180_set_the_root_password.sh
)

# after the first reboot
final_config_scripts=(
    305_setup_sudoers.sh
    "310_create_a_user.sh ${user}"
    320_disable_root_login.sh

    "400_install_and_configure_vim.sh -c ${config_dir} -u ${user}"
)

case ${stage} in
    basic-install)
        [ -n "${system_disk}" ] || { log_err "'-d|--sys-disk' must be set"; exit 1; }

        for i in "${basic_install_scripts[@]}"; do
            cmd_do ./${i}
        done
        ;;
    basic-config)
        [ -n "${hostname}" ] || { log_err "'-h|--hostname' must be set"; exit 1; }
        [ -n "${cpu_manufacturer}" ] || { log_err "'-c|--cpu-manufacturer' must be set"; exit 1; }

        for i in "${basic_config_scripts[@]}"; do
            cmd_do ./${i}
        done
        echo "Exit the chroot environment by typing exit or pressing Ctrl+D."
        echo "Optionally manually unmount all the partitions with 'umount -R /mnt'."
        echo "Restart the machine by typing 'reboot'."
        ;;
    final-config)
        [ -n "${user}" ] || { log_err "'-u|--user' must be set"; exit 1; }

        for i in "${final_config_scripts[@]}"; do
            cmd_do ./${i}
        done
        ;;
    *) # unknown option
        show_help
        exit 1
        ;;
esac
