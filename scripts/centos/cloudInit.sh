#!/bin/bash

###################################################################
#
# cloudInit.sh
#
#   Install cloud-init.
#
#
###################################################################

# Exit immediately on non-zero status
set -e

yum install -y -q cloud-init

exit 0
