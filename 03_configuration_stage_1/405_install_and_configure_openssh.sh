#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(openssh)

install_pkgs "${pkgs[@]}"

ssh_dir="${user_dir}/.ssh"
mk_dest_config_dir ${ssh_dir}
github_com_key="${ssh_dir}/id_ed25519_github"
cmd_do ssh-keygen -t ed25519 -N \"\" -C "${user}@$(hostname)-$(date -I)" -f ${github_com_key}
cmd_do chown ${user}:${user} "${github_com_key}" "${github_com_key}.pub"

ssh_config="${ssh_dir}/config"
cmd_do 'cat >${ssh_config} <<EOF
Host github.com
   IdentitiesOnly yes
   IdentityFile ${github_com_key}
EOF'

cmd_do chown -c ${user}:${user} "${ssh_config}"
cmd_do chmod 600 "${ssh_config}"
