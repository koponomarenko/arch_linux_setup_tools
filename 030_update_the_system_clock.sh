#!/bin/bash
. functions.sh

cmd_do timedatectl set-ntp true >/dev/null
