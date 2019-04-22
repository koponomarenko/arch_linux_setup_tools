#!/bin/bash

. ${root_dir}/common_helpers/functions.sh

echo ""
echo "This is the last step before a reboot into the new system"
echo ""
echo "Enter root password for the new system"
passwd
