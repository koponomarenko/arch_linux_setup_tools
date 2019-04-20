#!/bin/bash
. functions.sh
. packages.sh

#TODO: must be executed with superuser rights, check for the rights.
#TODO: use script params to pass username and pass to this script.

printer_pkgs=(
    cups
    samba  # for shared printers
)

cmd_do pacman -Syu --noconfirm --needed ${printer_pkgs[@]}

cmd_do systemctl enable org.cups.cupsd.service
cmd_do systemctl start org.cups.cupsd.service

cmd_do cat >/etc/samba/smb.conf <<EOF
workgroup = SYNAPSE
EOF

cmd_do cat >/etc/cups/printers.conf <<EOF
<DefaultPrinter HPLJ KBP6R Main>
Info HP LaserJet 4350
Location KBP6R Main
DeviceURI smb://username:password@print-kbp/Printer-KBP6R-MFD1
State Idle
StateTime 1244101216
Accepting Yes
Shared Yes
JobSheets none none
QuotaPeriod 0
PageLimit 0
KLimit 0
OpPolicy default
ErrorPolicy retry-job
</Printer>
EOF
