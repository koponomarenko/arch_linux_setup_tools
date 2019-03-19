#!/bin/bash
. functions.sh

#TODO: Harden with Sudo Example:
# https://wiki.archlinux.org/index.php/sudo#Harden_with_Sudo_Example

custom_sudoers_file="/etc/sudoers.d/custom_sudoers"

cmd_do 'cat >${custom_sudoers_file} <<EOF
# allow members of group wheel to execute any command
%wheel ALL=(ALL) ALL
EOF'

cmd_do chown -c root:root ${custom_sudoers_file}
cmd_do chmod 0440 ${custom_sudoers_file}

# validate the file
cmd_do visudo -c -f ${custom_sudoers_file}
