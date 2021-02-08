#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# === This file is part of Calamares - <https://github.com/calamares> ===
#
#   Copyright 2014, Kevin Kofler <kevin.kofler@chello.at>
#   Copyright 2016, Philip Müller <philm@manjaro.org>
#   Copyright 2017, Alf Gaida <agaida@siduction.org>
#
#   Calamares is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   Calamares is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with Calamares. If not, see <http://www.gnu.org/licenses/>.
#
# Modified by Bruno Goncalves ( www.biglinux.com.br )
#

import libcalamares
import os
import shutil
import subprocess
import sys
from libcalamares.utils import check_target_env_call, debug



def run():
    """
    Generate machine-id using dbus and systemd.

    :return:
    """
    root_mount_point = libcalamares.globalstorage.value("rootMountPoint")
#    subprocess.call(["grub-fix2.sh", root_mount_point + '/boot/EFI' ])
#    subprocess.call(["umount", root_mount_point + '/boot/EFI'])
    subprocess.call(["btrfs", "filesystem", "defragment", "-r", root_mount_point + '/boot'])
#   subprocess.call(["mkdir", root_mount_point + '/boot2'])
    subprocess.call(["btrfs", "property", "set", root_mount_point + '/boot/', "compression", "lzo"])
    #subprocess.call(["cp", "-Rf", root_mount_point + '/boot/', root_mount_point + '/boot2/boot/'])
    #subprocess.call(["rm", "-Rf", root_mount_point + '/boot/'])
    #subprocess.call(["mv", root_mount_point + '/boot2/boot/', root_mount_point + '/boot/'])
    #subprocess.call(["rm", "-Rf", root_mount_point + '/boot2/'])


    return None
