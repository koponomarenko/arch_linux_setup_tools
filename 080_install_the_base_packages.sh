#!/bin/bash
. functions.sh
. packages.sh

cmd_do pacstrap /mnt ${base_pkgs[@]}
