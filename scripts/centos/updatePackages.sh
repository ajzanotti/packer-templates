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

# Exit immediately on non-zero status
set -e

yum update -y -q
reboot
