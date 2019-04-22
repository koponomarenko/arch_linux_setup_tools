#!/bin/bash

. ${root_dir}/common_helpers/functions.sh

# Check if we are in UEFI mode
if ! ls /sys/firmware/efi/efivars &>/dev/null; then
    log_err "This is not UEFI mode. Make sure to boot in UEFI mode"
fi
