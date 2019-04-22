#!/bin/bash

. ${root_dir}/common_helpers/functions.sh

if [ -z "${1}" ]; then
    log_err "What is the directory with the scripts?"
    exit 1
fi

# ${1} == <scripts_dir>
scripts_dir="${1}"
dest_dir="/mnt/root"

cmd_do cp -r ${scripts_dir} ${dest_dir}/.
echo ""
echo "'${scripts_dir}' was copied to '${dest_dir}'"
echo ""
