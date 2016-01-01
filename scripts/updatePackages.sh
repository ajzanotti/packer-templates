#!/bin/bash

###################################################################
#
# updatePackages.sh
#
#   Update all installed packages to the latest available
#   version.
#
#
###################################################################

yum update -y

reboot
sleep 60

exit 0
