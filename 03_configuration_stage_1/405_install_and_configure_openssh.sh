#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(openssh)

install_pkgs "${pkgs[@]}"

github_com_key="${user_dir}/.ssh/id_ed25519_github"
cmd_do ssh-keygen -t ed25519 -N \"\" -C "$(whoami)@$(hostname)-$(date -I)" -f ${github_com_key}

ssh_config="${user_dir}/.ssh/config"
cmd_do 'cat >${ssh_config} <<EOF
Host github.com
   IdentitiesOnly yes
   IdentityFile ${github_com_key}
EOF'

cmd_do chown -c ${user}:${user} "${ssh_config}"
cmd_do chmod 600 "${ssh_config}"
