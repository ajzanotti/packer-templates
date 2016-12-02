#!/bin/bash

###################################################################
#
#	virtualbox.sh
#
#		Install VirtualBox Guest Additions and required dependencies.
#
#
###################################################################

# Exit immediately on non-zero status
set -e

VBOX_VERSION="$(cat $HOME/.vbox_version)"
export MAKE='/usr/bin/gmake -i'

yum install -y -q bzip2 gcc kernel-devel-`uname -r`

mount -o loop "$HOME"/VBoxGuestAdditions_"$VBOX_VERSION".iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt

rm -f "$HOME"/VBoxGuestAdditions_*.iso "$HOME"/.vbox_version

exit 0
