#!/bin/bash

# Purpose: Install TheSLinux public keyring onto ArchLinux system
# Author : Anh K. Huynh
# Date   : 2014 Nov 26
# License: MIT

_D_KEYRING="${PREFIX:-/usr/}/share/pacman/keyrings/"

[[ "$(id -u)" == "0" ]] \
|| {
  echo >&2 ":: This script should be executed as 'root'."
  exit 1
}

grep -q "Arch Linux" /etc/issue \
|| {
  echo >&2 ":: This script should be executed on ArchLinux system"
  exit 1
}

[[ -d "$_D_KEYRING" ]] \
|| {
  echo >&2 ":: Directory not found '$_D_KEYRING'"
  exit 1
}

cp -iv theslinux.gpg theslinux-trusted "$_D_KEYRING"

echo "Please invoke the following command to populate your new keyring"
echo
echo "  pacman-key --populate theslinux"
echo
echo "(This command should be executed under 'root' account.)"
