#!/bin/bash

. ${root_dir}/common_helpers/functions.sh

env_is_ready="true"

if [ -z "${target_user}" ]; then
    log_err "A username for a user on the new system is not set!"
    log_err "Set it with \"export target_user=<username>\""
    env_is_ready="false"
fi

if [[ ${env_is_ready} != "true" ]]; then
    echo "Not all needed environment variables are set. Do you want to proceed?"
    read -p "(Y/n): " choice
    case "$choice" in
      y*|Y*|"" ) ;;
      n*|N* ) echo "exit" && exit 2 ;;
      * ) echo "invalid choice" && exit 1 ;;
    esac
fi
