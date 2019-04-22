#!/bin/bash

. ${root_dir}/common_helpers/functions.sh

# Check if there is a connection to the internet
if ! ping -c 1 archlinux.org &>/dev/null; then
    log_err "There is no connection to the internet. Make sure there is a connection to the internet"
fi
