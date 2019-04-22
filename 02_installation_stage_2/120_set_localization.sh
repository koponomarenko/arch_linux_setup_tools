#!/bin/bash

. ${root_dir}/common_helpers/functions.sh

# Uncomment en_US.UTF-8 UTF-8 and other needed locales in /etc/locale.gen
locale="en_US.UTF-8 UTF-8"
cmd_do 'sed -i "/#${locale}/s/^#//g" /etc/locale.gen'

# and generate them with:
cmd_do locale-gen

# Set the LANG variable in locale.conf(5)
cmd_do 'cat >/etc/locale.conf <<EOF
LANG=en_US.UTF-8
EOF'
