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

# Exit script immediately on non-zero status
set -e

yum update -y
reboot
