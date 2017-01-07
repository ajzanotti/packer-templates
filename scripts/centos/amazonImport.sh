#!/bin/bash

###################################################################
#
# amazonImport.sh
#
#   Perform all installation, configuration, and provisioning
#   necessary for machines that will be processed by the
#   amazon-import post-processor.
#
#
###################################################################

# Exit immediately on non-zero status
set -e

yum install -y -q cloud-init

# Set random root password
randomRootPassword="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)"
echo root:"$randomRootPassword" | chpasswd

rm -f "$HOME"/VBoxGuestAdditions_*.iso "$HOME"/.vbox_version

exit 0
