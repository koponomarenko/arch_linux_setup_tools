#!/bin/bash
. functions.sh

pkgs=(firefox)

. common_install_and_configure.sh

install_pkgs

#TODO: move this out of /usr/bin.
firefox_wl="/usr/bin/firefox-wayland"
if [ ! -f "${firefox_wl}" ]; then
    cmd_do 'cat >${firefox_wl} <<EOF
#!/bin/bash
GDK_BACKEND=wayland firefox
EOF'
    chmod +x "${firefox_wl}"
fi
