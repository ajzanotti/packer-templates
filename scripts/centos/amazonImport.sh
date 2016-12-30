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

exit 0
