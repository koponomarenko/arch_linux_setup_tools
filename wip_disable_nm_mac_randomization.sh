#!/bin/bash
. functions.sh

# Reading on this topic:
# https://blogs.gnome.org/lkundrak/2016/01/18/networkmanger-and-tracking-protection-in-wi-fi-networks/
# https://blogs.gnome.org/thaller/2016/08/26/mac-address-spoofing-in-networkmanager-1-4-0/

cmd_do 'cat >/etc/NetworkManager/conf.d/wifi_rand_mac.conf <<EOF
[device]
wifi.scan-rand-mac-address=no
EOF'
