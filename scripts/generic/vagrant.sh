#!/bin/bash

###################################################################
#
#	vagrant.sh
#
#   Perform setup required by the Vagrant post-processor.
#
#
###################################################################

VAGRANT_USER="vagrant"
VAGRANT_GROUP="$VAGRANT_USER"
VAGRANT_PASSWORD="$VAGRANT_USER"
VAGRANT_HOME="/home/$VAGRANT_USER"

groupadd --gid 501 "$VAGRANT_GROUP"
useradd --create-home --home "$VAGRANT_HOME" --gid "$VAGRANT_GROUP" --uid 501 "$VAGRANT_USER"

echo root:"$VAGRANT_PASSWORD" | chpasswd
echo "$VAGRANT_USER":"$VAGRANT_PASSWORD" | chpasswd

# Install vagrant insecure public key
mkdir -pm 700 "$VAGRANT_HOME"/.ssh
curl -L https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -o "$VAGRANT_HOME"/.ssh/authorized_keys
chmod 0600 "$VAGRANT_HOME"/.ssh/authorized_keys
chown -R "$VAGRANT_USER":"$VAGRANT_GROUP" "$VAGRANT_HOME"/.ssh

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

cat <<EOF>/etc/sudoers.d/"$VAGRANT_USER"
$VAGRANT_USER ALL=(ALL) NOPASSWD:ALL
Defaults:$VAGRANT_USER !requiretty
EOF
chmod 0440 /etc/sudoers.d/"$VAGRANT_USER"

# Improve SSH performance by disabling DNS
sed -i 's/^#UseDNS\ yes/UseDNS\ no/' /etc/ssh/sshd_config

exit 0
