#!/bin/bash

# 主题目录
THEMES_DIR="/usr/share/grub/theme"
THEME_FILE="/etc/default/grub"

# 获取所有主题的名称
THEMES=($(ls $THEMES_DIR))

# 随机选择一个主题
RANDOM_THEME=${THEMES[$RANDOM % ${#THEMES[@]}]}

# 生成新的主题路径
NEW_THEME="GRUB_THEME=\"${THEMES_DIR}/${RANDOM_THEME}/theme.txt\""

# 检查 theme.cfg 文件中是否已存在 GRUB_THEME 配置
if grep -q "GRUB_THEME=" $THEME_FILE; then
    # 如果已经存在，更新该行
    sed -i "s|^GRUB_THEME=.*|$NEW_THEME|" $THEME_FILE
else
    # 如果不存在，追加新的主题配置
    sed -i "\$a$NEW_THEME" $THEME_FILE
fi

# 更新 GRUB 配置
grub-mkconfig -o /boot/grub/grub.cfg
