#!/bin/bash

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "This script must be sourced, not executed (e.g.: source ${BASH_SOURCE[0]})"
fi

this_script_dir="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

export root_dir="${this_script_dir}"
export config_dir=${root_dir}/config
