#!/bin/bash

. common_helpers/functions.sh

. common_helpers/common_prepare.sh

run_dir="${root_dir}/_run/dell_xps_13_9370"
mkdir -p ${run_dir}

hw_dir="./00_hw_specific/dell_xps_13_9370"

tmp_file="$(mktemp -t ${root_dir##*/}.XXXXXXXXXX)"

>${tmp_file}
dir="./01_installation_stage_1"
dest_file="${run_dir}/01_installation_stage_1.sh"
get_all_in_dir ${dir} ${tmp_file}
finalize_script ${dir} ${tmp_file} ${dest_file}

>${tmp_file}
dir="./02_installation_stage_2"
dest_file="${run_dir}/02_installation_stage_2.sh"
get_all_in_dir ${dir} ${tmp_file}
finalize_script ${dir} ${tmp_file} ${dest_file}

>${tmp_file}
dir="./03_configuration_stage_1"
dest_file="${run_dir}/03_configuration_stage_1.sh"
get_all_in_dir ${dir} ${tmp_file}
finalize_script ${dir} ${tmp_file} ${dest_file}

>${tmp_file}
dir="./04_sway_wm"
dest_file="${run_dir}/04_sway_wm.sh"
get_all_in_dir ${dir} ${tmp_file}
finalize_script ${dir} ${tmp_file} ${dest_file}

sed -i -e '/install_and_configure_sway/a\' -e "${hw_dir}/configure_hidpi_for_sway.sh" \
    ${dest_file}

