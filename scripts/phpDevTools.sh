#!/bin/bash

###################################################################
#
#	phpDevTools.sh
#
#   Installs PHP development tools (Composer, bower, node, etc).
#   The script requires that PHP is installed first
#   (see LAMP.sh).
#
#   Supports CentOS 6 and 7. Does NOT support CentOS 5.
#
#
###################################################################

DISTRO_VERSION="unknown"

GetDistroVersion()
{
  distroVersionString=$(awk '{print $(NF-1);}' /etc/redhat-release)
  regex='([0-9]{1})\.([0-9]{1,2})(\.[0-9]{4})?'

  if [[ "${distroVersionString}" =~ ${regex} ]]
  then
    DISTRO_VERSION="${BASH_REMATCH[1]}"
  fi
}

GetDistroVersion

case "${DISTRO_VERSION}" in
  [6-7])
    # Install NodeJS / npm
    curl --silent --location https://rpm.nodesource.com/setup | bash -
    yum install nodejs -y

    # Upgrade NodeJS / npm to latest stable
    npm cache clean -f
    npm install --global n
    n stable

    # Install composer
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer

    # Install gulp
    npm install --global gulp

    # Install bower
    npm install --global bower

    # Install Laravel if this is a vagrant box
    if id -u "vagrant" > /dev/null 2>&1
    then
      VAGRANT_HOME=$(grep vagrant /etc/passwd | awk -F : '{print $6;}')
      su - vagrant -c "composer global require \"laravel/installer=~1.1\""
      su - vagrant -c "echo \"export PATH=$PATH:/usr/local/bin:${VAGRANT_HOME}/.composer/vendor/bin\" >> .bash_profile"
    fi
    ;;
  *)
  echo "ERROR: unknown or unsupported distro. Exiting..."
  exit -1
  ;;
esac

exit 0
