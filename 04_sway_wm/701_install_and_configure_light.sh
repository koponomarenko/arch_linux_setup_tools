#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(
    light # Program to easily change brightness on backlight-controllers.
)

install_pkgs "${pkgs[@]}"

# Configure screen_brightness.sh
screen_brightness="/usr/local/bin/screen_brightness.sh"
cmd_do cp ${root_dir}/tools/screen_brightness.sh ${screen_brightness}
cmd_do chmod +x ${screen_brightness}

# Give permissions to "light"
#setcap cap_dac_override+eip /usr/bin/light
