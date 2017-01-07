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

apt-get install -y -q gcc build-essential

mount -o loop "$HOME"/VBoxGuestAdditions_"$VBOX_VERSION".iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt

rm -f "$HOME"/VBoxGuestAdditions_*.iso "$HOME"/.vbox_version

exit 0
