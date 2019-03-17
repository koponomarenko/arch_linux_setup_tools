#!/bin/bash
. functions.sh

# Check if we are in UEFI mode
cmd_do ls /sys/firmware/efi/efivars >/dev/null
