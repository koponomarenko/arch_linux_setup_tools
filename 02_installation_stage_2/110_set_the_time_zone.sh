#!/bin/bash

. ${root_dir}/common_helpers/functions.sh

cmd_do ln -sf /usr/share/zoneinfo/Europe/Kiev /etc/localtime

# Set the hardware clock to UTC
cmd_do timedatectl set-local-rtc 0
cmd_do hwclock --systohc
