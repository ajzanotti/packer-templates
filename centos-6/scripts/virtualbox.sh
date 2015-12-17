#!/bin/bash

###################################################################
#
#	virtualbox.sh
#
#		This script installs VirtualBox Guest Additions and
#		required dependencies. This script will look for the
#		installation ISO in the $HOME of the "ssh_username" user
#		specified in the template.json.
#
#
###################################################################

VBOX_VERSION=$(cat $HOME/.vbox_version)
export MAKE='/usr/bin/gmake -i'

yum install -y gcc kernel-devel-`uname -r`

cd /tmp
mount -o loop $HOME/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf $HOME/VBoxGuestAdditions_*.iso

exit 0