#!/bin/bash

###################################################################
#
# ubuntuUpdatePackages.sh
#
#   Update all installed packages to the latest available
#   version.
#
#
###################################################################

# Exit immediately on non-zero status
set -e

apt-get upgrade -y -q
reboot
