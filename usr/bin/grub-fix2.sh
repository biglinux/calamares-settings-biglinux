#!/bin/bash

#secure boot
if [ "$(ls /sys/firmware/efi/efivars/ | grep SecureBoot)" != "" ]; then

mkdir -p "$1/EFI/ubuntu"
mkdir -p "$1/EFI/biglinux-shim"

if [ -e "$1/EFI/ubuntu" ]; then

    if [ ! -e "$1/EFI/ubuntu-bkp" ]; then
        cp -Rf "$1/EFI/ubuntu" "$1/EFI/ubuntu-bkp"
    fi

fi


cp -f "/usr/share/efi/ubuntu/fbx64.efi" "$1/EFI/ubuntu/fbx64.efi"
cp -f "/usr/share/efi/ubuntu/grubx64.efi" "$1/EFI/ubuntu/grubx64.efi"
cp -f "/usr/share/efi/ubuntu/mmx64.efi" "$1/EFI/ubuntu/mmx64.efi"
cp -f "/usr/share/efi/ubuntu/shimx64.efi" "$1/EFI/ubuntu/shimx64.efi"

cp -f "/usr/share/efi/biglinux-shim/fbx64.efi" "$1/EFI/biglinux-shim/fbx64.efi"
cp -f "/usr/share/efi/biglinux-shim/grubx64.efi" "$1/EFI/biglinux-shim/grubx64.efi"
cp -f "/usr/share/efi/biglinux-shim/mmx64.efi" "$1/EFI/biglinux-shim/mmx64.efi"
cp -f "/usr/share/efi/biglinux-shim/shimx64.efi" "$1/EFI/biglinux-shim/shimx64.efi"

cp -f "$1/EFI/BigLinux/grub.cfg" "$1/EFI/ubuntu/grub.cfg"
cp -f "$1/EFI/BigLinux/grub.cfg" "$1/EFI/biglinux-shim/grub.cfg"


partition="$(findmnt -n -o SOURCE --target $1)"
device="$(echo "$partition" | sed 's|[0-9]||g')"
num_device="$(echo "$partition" | sed 's|.*[a-z]||g')"

efibootmgr -c -d $device -p $num_device -L "ubuntu" -l "/EFI/ubuntu/grubx64.efi"
efibootmgr -c -d $device -p $num_device -L "biglinux-shim" -l "/EFI/biglinux-shim/shimx64.efi"

fi
