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

UPDATE_COMMAND=''
UPDATE_OPTS=''

# Exit immediately on non-zero status
set -e

if command -v yum > /dev/null 2>&1
then
  UPDATE_COMMAND='yum'
  UPDATE_OPTS='update -y -q'
elif command -v apt-get > /dev/null 2>&1
then
  UPDATE_COMMAND='apt-get'
  UPDATE_OPTS='upgrade -qq'
else
  exit -1
fi

$UPDATE_COMMAND $UPDATE_OPTS
reboot
