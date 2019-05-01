#!/bin/bash
  
. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

this_script_dir="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
pushd ${this_script_dir}

copy_config_file "config/sway/config.d/hw_output" "${user_config_dir}/sway/config.d/hw_output"
