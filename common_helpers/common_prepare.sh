#!/bin/bash


# Forward checks which remind to set a correct environment

if [ -z "${root_dir}" ]; then
    log_err "Source \"set_environment.sh\" script (e.g.: source set_environment.sh)"
    exit 1
fi

if [ -z "${config_dir}" ]; then
    log_err "Source \"set_environment.sh\" script (e.g.: source set_environment.sh)"
    exit 1
fi

# Generate high level scripts

get_all_in_dir() {
    local dir=${1}
    local res_file=${2}
    find ${dir} -maxdepth 1 -type f >>${res_file}
}

finalize_script() {
    local dir=${1}
    local in_file=${2}
    local out_file=${3}

    echo "#!/bin/bash" >${out_file}

    cat <<EOF >>${out_file}

pushd ${root_dir}

${dir}/checks/checks.sh || exit 1

EOF

    sort ${in_file} >>${out_file}
    chmod +x ${out_file}
}

