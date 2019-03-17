#!/bin/bash
. functions.sh

# GNOME desktop environment 
cmd_do pacman -Syu --noconfirm gnome
cmd_do systemctl enable gdm.service
