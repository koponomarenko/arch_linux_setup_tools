#!/bin/bash

. common_helpers/functions.sh

# Forward checks which remind to set a correct environment

if [ -z "${root_dir}" ]; then
    log_err "Source \"set_environment.sh\" script (e.g.: source set_environment.sh)"
    exit 1
fi

if [ -z "${config_dir}" ]; then
    log_err "Source \"set_environment.sh\" script (e.g.: source set_environment.sh)"
    exit 1
fi

env_is_ready="true"

if [[ ${disk} != /dev/* ]]; then
    log_err "A disk to use for the new system installation is not set!"
    log_err "Set it with \"export disk=/dev/<disk>\""
    env_is_ready="false"
fi

if [ -z "${hostname}" ]; then
    log_err "A hostname to use for the new system is not set!"
    log_err "Set it with \"export hostname=<hostname>\""
    env_is_ready="false"
fi

if [ -z "${target_user}" ]; then
    log_err "A username for a user on the new system is not set!"
    log_err "Set it with \"export target_user=<username>\""
    env_is_ready="false"
fi

if [[ ${env_is_ready} != "true" ]]; then
    echo "Not all environment variables are set. Do you want to proceed?"
    read -p "(Y/n): " choice
    case "$choice" in
      y*|Y*|"" ) ;;
      n*|N* ) echo "exit" && exit 0 ;;
      * ) echo "invalid choice" && exit 1 ;;
    esac
fi

# Generate high level scripts

get_all_in_dir() {
    local dir=${1}
    local res_file=${2}
    find ${dir} -maxdepth 1 -type f >>${res_file}
}

finalize_script() {
    local in_file=${1}
    local out_file=${2}
    echo "#!/bin/bash" >${out_file}
    sort ${in_file} >>${out_file}
    chmod +x ${out_file}
}

tmp_file="$(mktemp -t ${root_dir##*/}.XXXXXXXXXX)"

>${tmp_file}
get_all_in_dir "./01_installation_stage_1" ${tmp_file}
# insert other needed scripts if any
finalize_script ${tmp_file} "${root_dir}/01_installation_stage_1.sh"

>${tmp_file}
get_all_in_dir "./02_installation_stage_2" ${tmp_file}
# insert other needed scripts if any
finalize_script ${tmp_file} "${root_dir}/02_installation_stage_2.sh"

>${tmp_file}
get_all_in_dir "./03_configuration_stage_1" ${tmp_file}
# insert other needed scripts if any
finalize_script ${tmp_file} "${root_dir}/03_configuration_stage_1.sh"
