#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install.sh

if [ -z "${hostname}" ]; then
    log_err "A hostname to use for the new system is not set!"
    log_err "Set it with \"export hostname=<hostname>\""
    exit 1
fi

pkgs=(
    networkmanager
)

# Create the hostname file
cmd_do 'cat >/etc/hostname <<EOF
${hostname}
EOF'

# Add matching entries to hosts(5)
cmd_do 'cat >/etc/hosts <<EOF
127.0.0.1   localhost
::1         localhost
127.0.1.1   ${hostname}.localdomain	${hostname}
EOF'

# Complete the network configuration for the new system
install_pkgs "${pkgs[@]}"
systemctl enable NetworkManager.service
