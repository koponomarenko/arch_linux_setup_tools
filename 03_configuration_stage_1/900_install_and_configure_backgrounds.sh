#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

mkdir -p /usr/local/share/backgrounds/custom
cp ${root_dir}/images/backgrounds/* /usr/local/share/backgrounds/custom/.
