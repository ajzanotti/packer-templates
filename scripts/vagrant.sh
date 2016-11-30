#!/bin/bash

###################################################################
#
#	vagrant.sh
#
#   This script performs all setup required to prepare a
#   build for the vagrant post-processor minus the installation
#   of VirtualBox Guest Additions (see virtualbox.sh)
#
#
###################################################################

VAGRANT_HOME="/home/vagrant"

groupadd --gid 501 vagrant
useradd --create-home --home "$VAGRANT_HOME" --gid vagrant --uid 501 vagrant

echo "vagrant" | passwd --stdin root
echo "vagrant" | passwd --stdin vagrant

# Install vagrant insecure key
mkdir -pm 700 "$VAGRANT_HOME"/.ssh
curl -L https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -o "$VAGRANT_HOME"/.ssh/authorized_keys
chmod 0600 "$VAGRANT_HOME"/.ssh/authorized_keys
chown -R vagrant:vagrant "$VAGRANT_HOME"/.ssh

# Read additional configuration from /etc/sudoers.d
if ! grep -q '#includedir /etc/sudoers.d' /etc/sudoers
then

cat <<EOF>>/etc/sudoers

## Read drop-in files from /etc/sudoers.d (the # here does not mean a comment)
#includedir /etc/sudoers.d
EOF

fi

if [ ! -d '/etc/sudoers.d' ]
then
  mkdir /etc/sudoers.d
  chmod 750 /etc/sudoers.d
fi

cat <<EOF>/etc/sudoers.d/vagrant
vagrant ALL=(ALL) NOPASSWD:ALL
Defaults:vagrant !requiretty
EOF
chmod 0440 /etc/sudoers.d/vagrant

# Improve SSH performance by disabling DNS
sed -i 's/^#UseDNS\ yes/UseDNS\ no/' /etc/ssh/sshd_config

exit 0
