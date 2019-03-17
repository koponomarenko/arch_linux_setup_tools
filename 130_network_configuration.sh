#!/bin/bash
. functions.sh

if [ -z "${1}" ]; then
    log_err "What hostname to use for the system?"
    exit 1
fi

# hostname="xyz"
hostname="${1}"

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
cmd_do pacman -Syu --noconfirm networkmanager
systemctl enable NetworkManager.service
