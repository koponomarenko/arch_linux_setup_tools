#!/bin/bash

. ${root_dir}/common_helpers/functions.sh
. ${root_dir}/common_helpers/common_install_and_configure.sh

pkgs=(
    pulseaudio # A featureful, general-purpose sound server.
    pavucontrol # Simple GTK+ volume control tool ("mixer") for PulseAudio.
)

install_pkgs "${pkgs[@]}"
