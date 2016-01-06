#!/bin/bash

###################################################################
#
# updatePackages.sh
#
#   Update all installed packages to the latest available
#   version.
#
#   This script must be run BEFORE virtualbox.sh in order for
#   VirtualBox Guest Additions to install correctly.
#
#
###################################################################

yum update -y

reboot
sleep 60

exit 0
