#!/bin/bash

. ${root_dir}/common_helpers/functions.sh

if [ -z "${target_user}" ]; then
    log_err "A username for a user on the new system is not set!"
    log_err "Set it with \"export target_user=<username>\""
fi

username="${target_user}"

cmd_do useradd -m -s /bin/bash ${username}
echo ""
echo "Enter a password for '${username}'"
echo ""
cmd_do passwd ${username}

cmd_do usermod -aG wheel ${username}
