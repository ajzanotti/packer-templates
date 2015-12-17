#!/bin/bash

###################################################################
#
#	vagrant.sh
#
#		This script performs all setup required to prepare a
#		build for the vagrant post-processor.
#
#
###################################################################

VAGRANT_HOME="/home/vagrant"

echo "vagrant" | passwd --stdin root

groupadd --gid 501 vagrant
useradd --create-home --home $VAGRANT_HOME --gid vagrant --uid 501 vagrant
echo "vagrant" | passwd --stdin vagrant

# Install vagrant insecure key
mkdir -pm 700 $VAGRANT_HOME/.ssh
curl -L https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -o $VAGRANT_HOME/.ssh/authorized_keys
chmod 0600 $VAGRANT_HOME/.ssh/authorized_keys
chown -R vagrant:vagrant $VAGRANT_HOME/.ssh

# Allow vagrant to execute all commands without a password
echo "vagrant ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/vagrant
echo "Defaults:vagrant !requiretty" >> /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

# Improve SSH performance by disabling DNS
sed -i 's/^#UseDNS\ yes/UseDNS\ no/' /etc/ssh/sshd_config

exit 0