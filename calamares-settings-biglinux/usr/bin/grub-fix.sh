#!/bin/bash

sed -i "s|GRUB_CMDLINE_LINUX_DEFAULT=\"|GRUB_CMDLINE_LINUX_DEFAULT=\"$(cat /proc/cmdline | sed 's|initrd=.*.lz||g;s|union=overlay||g;s|toram||g;s|quiet||g;s|splash||g;s|boot=casper||g;s|maybe-ubiquity||g')|g" $*

echo 'GRUB_THEME=/boot/grub/themes/biglinux/theme.txt' >>  $*

echo 'GRUB_RECORDFAIL_TIMEOUT="$GRUB_TIMEOUT"' >>  $*

sed -i 's|GRUB_TIMEOUT=.*|GRUB_TIMEOUT="5"|g' $*

sed -i 's|GRUB_DISTRIBUTOR=.*|GRUB_DISTRIBUTOR="BigLinux"|g' $*

sed -i 's|GRUB_TIMEOUT_STYLE=.*|GRUB_TIMEOUT_STYLE=menu|g' $*

sed -i 's| resume=.*"|"|g' $*

sed -i 's|#GRUB_DISABLE_RECOVERY="true"|GRUB_DISABLE_RECOVERY="true"|g' $*


#Change default desktop in sddm to use in livecd
echo "[Last]
Session=$(cat /tmp/big_desktop_changed | sed 's|.*/||g')" >> $(echo "$*" | sed 's|etc/default/grub|var/lib/sddm/state.conf|g')

cp -f /tmp/big_desktop_theme $(echo "$*" | sed 's|etc/default/grub|etc/default-theme-biglinux|g')
cp -f /tmp/big_performance_changed $(echo "$*" | sed 's|etc/default/grub|etc/default-performance-biglinux|g')

#Remove autodefrag in btrfs using ssd
sed -i '/btrfs.*ssd/ s/,ssd//g' $(echo "$*" | sed 's|etc/default/grub|etc/fstab|g')
