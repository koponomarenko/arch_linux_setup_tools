#!/bin/bash
. functions.sh

if [ -z "${1}" ]; then
    log_err "What username to use for the system?"
    exit 1
fi

# ${1} == username
username="${1}"

cmd_do useradd -m -s /bin/bash ${username}
echo "Enter a password for '${username}'"
cmd_do passwd ${username}

cmd_do usermod -aG wheel ${username}
