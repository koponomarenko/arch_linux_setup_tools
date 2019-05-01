#!/bin/bash
  
. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

dir="${root_dir}/00_hw_specific/dell_xps_13_9370/config/sway/config.d"
copy_config_file "${dir}/hidpi" "${user_config_dir}/sway/config.d/hidpi"
