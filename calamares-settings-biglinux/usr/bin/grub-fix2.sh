#!/bin/bash


# mkdir -p "$1/EFI/ubuntu"
mkdir -p "$1/EFI/biglinux-shim"

# if [ -e "$1/EFI/ubuntu" ]; then
# 
#     if [ ! -e "$1/EFI/ubuntu-bkp" ]; then
#         cp -Rf "$1/EFI/ubuntu" "$1/EFI/ubuntu-bkp"
#     fi
# 
# fi
#Chromium remember optimization
cp -f "/home/biglinux/.config/chromium-optimize" "$1/../../etc/skel/.config/chromium-optimize"
chmod 644  "$1/../../etc/skel/.config/chromium-optimize"

# cp -f "/usr/share/efi/ubuntu/fbx64.efi" "$1/EFI/ubuntu/fbx64.efi"
# cp -f "/usr/share/efi/ubuntu/grubx64.efi" "$1/EFI/ubuntu/grubx64.efi"
# cp -f "/usr/share/efi/ubuntu/mmx64.efi" "$1/EFI/ubuntu/mmx64.efi"
# cp -f "/usr/share/efi/ubuntu/shimx64.efi" "$1/EFI/ubuntu/shimx64.efi"

cp -f "/usr/share/efi/biglinux-shim/bootx64.efi" "$1/EFI/biglinux-shim/bootx64.efi"
cp -f "/usr/share/efi/biglinux-shim/grubx64.efi" "$1/EFI/biglinux-shim/grubx64.efi"
cp -f "/usr/share/efi/biglinux-shim/mmx64.efi" "$1/EFI/biglinux-shim/mmx64.efi"
cp -f "/usr/share/efi/biglinux-shim/shimx64.efi" "$1/EFI/biglinux-shim/shimx64.efi"



# cp -f "$1/EFI/BigLinux/grub.cfg" "$1/EFI/ubuntu/grub.cfg"
cp -f "$1/EFI/BigLinux/grub.cfg" "$1/EFI/biglinux-shim/grub.cfg"

sed -i 's|splashquiet|splash quiet|g' "$1/../../etc/default/grub"

partition="$(findmnt -n -o SOURCE --target $1)"
device="$(echo "$partition" | sed 's|[0-9]||g')"
num_device="$(echo "$partition" | sed 's|.*[a-z]||g')"

if [ "$(find /sys/firmware/efi/efivars/ -name SecureBoot-*)" != "" ]; then
    efibootmgr -c -d $device -p $num_device -L "BigLinux" -l "/EFI/BigLinux/grubx64.efi"
    efibootmgr -c -d $device -p $num_device -L "biglinux-shim" -l "/EFI/biglinux-shim/shimx64.efi"
else
    efibootmgr -c -d $device -p $num_device -L "biglinux-shim" -l "/EFI/biglinux-shim/shimx64.efi"
    efibootmgr -c -d $device -p $num_device -L "BigLinux" -l "/EFI/BigLinux/grubx64.efi"
fi
