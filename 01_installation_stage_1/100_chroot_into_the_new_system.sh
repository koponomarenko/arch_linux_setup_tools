#!/bin/bash

. ${root_dir}/common_helpers/functions.sh

echo ""
echo "installation_stage_1 completed."
echo ""

cmd_do arch-chroot /mnt
