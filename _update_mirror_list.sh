#!/bin/bash
. functions.sh

url="https://www.archlinux.org/mirrorlist/?country=all&protocol=https&ip_version=4&use_mirror_status=on"
curl -s "${url}" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 5 -
