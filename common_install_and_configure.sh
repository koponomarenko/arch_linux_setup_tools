#!/bin/bash
. functions.sh

set -o pipefail

show_help() {
    local script_name="$(basename -- "${0}")"
    cat <<EOF
${script_name} OPTIONS

${script_name} -c <config-dir> -u <user>
${script_name} -p

OPTIONS:
-c|--config-dir         Directory from which the config must be taken.
-u|--user               Username for a user on the new system.
-p|--print-pkgs         Show packages which whould be installed.
EOF
}

while [[ $# -gt 0 ]]; do
    key="${1}"
    case ${key} in
        -c|--config-dir)
            config_dir="${2}"
            shift # past argument
            shift # past value
            ;;
        -u|--user)
            user="${2}"
            shift # past argument
            shift # past value
            ;;
        -p|--print-pkgs)
            print_pkgs="1"
            shift # past argument
            ;;
        *) # unknown option
            shift # past argument
            ;;
    esac
done

[ -z "${print_pkgs}" ] || { echo ${pkgs[@]}; exit 0; }
[ -n "${config_dir}" ] || { log_err "'--config-dir' is not set"; show_help; exit 1; }
[ -n "${user}" ] || { log_err "'--user' is not set"; show_help; exit 1; }

cmd_do which getent >/dev/null
user_dir="$(cmd_do 'getent passwd ${user} | cut -d: -f6')"

install_pkgs() {
    cmd_do pacman -Syu --noconfirm --needed ${pkgs[@]}
}

copy_config_file() {
    local src_config_file="${1}"
    local dest_config_file="${2}"
    [ -n "${src_config_file}" ] || { log_err "'src_config_file' is not specified"; exit 1; }
    [ -n "${dest_config_file}" ] || { log_err "'dest_config_file' is not specified"; exit 1; }
    cmd_do cp "${src_config_file}" "${dest_config_file}"
    cmd_do chown -c ${user}:${user} "${dest_config_file}"
}
