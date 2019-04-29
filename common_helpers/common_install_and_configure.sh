#!/bin/bash

. ${root_dir}/common_helpers/functions.sh

set -o pipefail

show_help() {
    local script_name="$(basename -- "${0}")"
    cat <<EOF
${script_name} OPTIONS

${script_name} -u <user>
${script_name} -p

OPTIONS:
-u|--user               Username of a target user on the system.
-p|--print-pkgs         Show packages which whould be installed.
EOF
}

user=${target_user}

while [[ $# -gt 0 ]]; do
    key="${1}"
    case ${key} in
        -u|--user)
            user="${2}"
            shift # past argument
            shift # past value
            ;;
        -p|--print-pkgs)
            print_pkgs="yes"
            shift # past argument
            ;;
        *) # unknown option
            shift # past argument
            ;;
    esac
done

check_if_user_is_set() {
    [ -n "${user}" ] || { log_err "'--user' is not set"; show_help; exit 1; }
}

cmd_do which getent >/dev/null
user_dir="$(cmd_do_silent 'getent passwd ${user} | cut -d: -f6')"
user_config_dir="${user_dir}/.config" # $XDG_CONFIG_HOME (defaults to $HOME/.config)

install_pkgs() {
    local pkgs=("$@")
    [[ "${print_pkgs}" == "yes" ]] && { echo ${pkgs[@]}; exit 0; }
    cmd_do pacman -Syu --noconfirm --needed ${pkgs[@]}
}

mk_dest_config_dir() {
    check_if_user_is_set
    local dest_config_dir="${1}"
    if [ ! -d "${dest_config_dir}" ]; then
        # don't use '-p' because can't chown them
        cmd_do mkdir "${dest_config_dir}"
    fi
    cmd_do chown -c ${user}:${user} "${dest_config_dir}"
    cmd_do chmod 700 "${dest_config_dir}"
}

copy_config_file() {
    check_if_user_is_set
    local src_config_file="${1}"
    local dest_config_file="${2}"
    [ -n "${src_config_file}" ] || { log_err "'src_config_file' is not specified"; exit 1; }
    [ -f "${src_config_file}" ] || { log_err "'src_config_file' is not a file"; exit 1; }
    [ -n "${dest_config_file}" ] || { log_err "'dest_config_file' is not specified"; exit 1; }

    cmd_do cp "${src_config_file}" "${dest_config_file}"
    [ -f "${dest_config_file}" ] || { log_err "'dest_config_file' is not a file"; exit 1; }
    cmd_do chown -c ${user}:${user} "${dest_config_file}"
    cmd_do chmod 600 "${dest_config_file}"
}
