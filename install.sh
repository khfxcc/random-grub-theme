#!/bin/bash

F_PATH=$(pwd)
T_PATH="/usr/share/grub"
S_PATH="/etc/systemd/system"

chown root:root "${F_PATH}/random_grub_theme.sh"
for scpt in $(ls $F_PATH); do
    if test -f "${scpt}"
    then
        chmod +x "${scpt}"
    fi
done
cp -r "${F_PATH}/theme" "${T_PATH}"
cp "${F_PATH}/my-local.service" "${S_PATH}"
cp "${F_PATH}/my.local" "/etc"
chmod a+x "/etc/my.local"
mkdir "/etc/my.local.d"
cp "${F_PATH}/random_grub_theme.sh" "/etc/my.local.d"
systemctl enable my-local.service
