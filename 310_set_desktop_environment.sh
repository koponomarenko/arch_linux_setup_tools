#!/bin/bash
. functions.sh

# GNOME desktop environment 
cmd_do pacman -Syu --noconfirm --needed gnome
cmd_do systemctl enable gdm.service
