#!/bin/bash

. common_helpers/functions.sh

. common_helpers/common_prepare.sh

run_dir="${root_dir}/_run/pc_2014_08"
mkdir -p ${run_dir}

hw_dir="./00_hw_specific/pc_2014_08"

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

echo "${hw_dir}/install_wifi.sh" >>${dest_file}

>${tmp_file}
dir="./04_sway_wm"
dest_file="${run_dir}/04_sway_wm.sh"
get_all_in_dir ${dir} ${tmp_file}
finalize_script ${dir} ${tmp_file} ${dest_file}

sed -i -e '/install_and_configure_sway/a\' -e "${hw_dir}/configure_output_for_sway.sh" \
    ${dest_file}
