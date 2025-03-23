#!/bin/bash

THEMES_DIR="/usr/share/grub/theme"
THEME_FILE="/etc/default/grub"

THEMES=($(ls $THEMES_DIR))

RANDOM_THEME=${THEMES[$RANDOM % ${#THEMES[@]}]}

NEW_THEME="GRUB_THEME=\"${THEMES_DIR}/${RANDOM_THEME}/theme.txt\""

sed -i "/GRUB_THEME/d" $THEME_FILE
sed -i "\$a$NEW_THEME" $THEME_FILE

grub-mkconfig -o /boot/grub/grub.cfg
