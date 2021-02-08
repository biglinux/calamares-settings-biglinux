# -*- coding: utf-8 -*-
# SPDX-FileCopyrightText: 2019 Harald Sitter <sitter@kde.org>
# SPDX-License-Identifier: GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL

import os
import shutil

import libcalamares
from libcalamares.utils import check_target_env_call

def run():
    """ Cleaning up filesystem tools (must run after packages cleanup) """

    optional_filesystems = {
        'btrfs': 'btrfs-tools',
        'jfs': 'jfsutils',
        'reiserfs': 'reiserfsprogs',
        'xfs': 'xfsprogs'
    }

    partitions = libcalamares.globalstorage.value('partitions')

    # Drop all actually used filesystems from the optional dict.
    for partition in partitions:
        fs = partition['fs']
        if fs in optional_filesystems.keys():
            del optional_filesystems[fs]

    pkgs = list(optional_filesystems.values())
    if len(pkgs) > 0:
        check_target_env_call(["apt-get", "--purge", "-q", "-y",
                               "remove"] + pkgs)
        check_target_env_call(["apt-get", "--purge", "-q", "-y",
                               "autoremove"])

    return None
