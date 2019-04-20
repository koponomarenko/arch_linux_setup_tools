#!/bin/bash
. common_helpers/functions.sh

cmd_do genfstab -U /mnt >>/mnt/etc/fstab
