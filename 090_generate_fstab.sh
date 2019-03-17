#!/bin/bash
. functions.sh

cmd_do genfstab -U /mnt >>/mnt/etc/fstab
