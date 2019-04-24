#!/bin/bash

. ${root_dir}/common_helpers/functions.sh

scripts_dir="${root_dir}"
dest_dir="/mnt/root"

if [ -z "${scripts_dir}" ]; then
    log_err "The directory with the scripts to copy is not set!"
    exit 1
fi

cmd_do cp -r ${scripts_dir} ${dest_dir}/.
echo ""
echo "'${scripts_dir}' was copied to '${dest_dir}'"
echo ""
