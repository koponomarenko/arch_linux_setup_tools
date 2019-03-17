#!/bin/bash
. functions.sh

if [ -z "${1}" ]; then
    log_err "What username to use for the system?"
    exit 1
fi

# ${1} == username
username="${1}"

#useradd -m -G additional_groups -s /bin/bash ${username}
cmd_do useradd -m -s /bin/bash ${username}
echo "Enter a password for '${username}'"
cmd_do passwd ${username}

cmd_do usermod -aG wheel ${username}

#TODO:
# maybe install sudo package
# add the user to wheel group to be able to use sudo in Arch
# Harden with Sudo ...
# disable root user!!!
# https://wiki.archlinux.org/index.php/sudo

