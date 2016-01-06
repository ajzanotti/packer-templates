#!/bin/bash

###################################################################
#
#	LAMP.sh
#
#   Install Apache, MySQL, and PHP components.
#
#   Supports CentOS 6 and 7. Does NOT support CentOS 5.
#
#
###################################################################

DISTRO_VERSION="unknown"
PACKAGES="httpd mod_ssl mysql-community-server php56w php56w-mbstring php56w-mcrypt php56w-mysql php56w-soap php56w-xml"
YUM_OPTS="-y"

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
  7)
    # Webtatic repos
    rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm
    rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

    # MySQL Community repo
    rpm -Uvh https://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm

    yum install ${YUM_OPTS} ${PACKAGES}

    systemctl enable httpd.service
    systemctl enable mysqld.service
    ;;
  6)
    # Webtatic repo
    rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

    # MySQL Community repo
    rpm -Uvh https://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm

    yum install ${YUM_OPTS} ${PACKAGES}

    chkconfig httpd on
    chkconfig mysqld on
    ;;
  *)
    echo "ERROR: unknown or unsupported distro. Exiting..."
    exit -1
    ;;
esac

exit 0
