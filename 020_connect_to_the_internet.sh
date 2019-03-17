#!/bin/bash
. functions.sh

# Check connection to the internet
cmd_do ping -c 1 archlinux.org >/dev/null

#TODO: setup networking if there is no ping
