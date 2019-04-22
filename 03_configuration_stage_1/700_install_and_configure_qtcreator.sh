#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(qtcreator)

install_pkgs "${pkgs[@]}"

# Make Qt Creator use Wayland by default
# TODO: maybe set "QT_QPA_PLATFORM=wayland" globally instead
qtcreator_wayland="/usr/local/bin/qtcreator"
cmd_do 'cat >${qtcreator_wayland} <<EOF
#!/bin/sh
QT_WAYLAND_DISABLE_WINDOWDECORATION=1 QT_QPA_PLATFORM=wayland exec /usr/bin/qtcreator "\$@"
EOF'
cmd_do chmod +x "${qtcreator_wayland}"
