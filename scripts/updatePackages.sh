#!/bin/bash

###################################################################
#
# updatePackages.sh
#
#   Update all installed packages to the latest available
#   version.
#
#   It's recommended that this script be run BEFORE any other
#   provisioning script.
#
#
###################################################################

# Exit script immediately on non-zero status
set -e

yum update -y
reboot
