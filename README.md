# Arch Linux configs and scripts

A set of scripts and configs to help with installation and configuration of Arch Linux

## Some useful tips for a day to day work

### NetworkManager

Tags: `nmcli` `nmtui` `wifi`

Check status

    nmcli radio
    nmcli device

Show available networks and connect

    nmcli device wifi rescan
    nmcli device wifi list
    nmcli -a device wifi connect <SSID-name>

An alternative is `nmtui` - Text User Interface for controlling NetworkManager.

### Sound/audio control

Tags: `sound` `audio` `volume` `pulseaudio`

`pavucontrol` is a GUI volume control tool ("mixer") for PulseAudio.

### Markdown Preview

Tags: `markdown`

**grip** is a nice tool to preview a markdown file in a browser - 
https://github.com/joeyespo/grip.

    cd <dir_with_file>
    grip

or 

    grip <file_name>

