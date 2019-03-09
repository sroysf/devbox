#!/bin/bash

echo "Installing ceph-deploy and Ceph prerequisites"
wget -q -O- 'https://download.ceph.com/keys/release.asc' | apt-key add -
echo "deb http://download.ceph.com/debian-luminous/ xenial main" | tee /etc/apt/sources.list.d/ceph.list
apt-get update
apt-get install -y ceph-deploy

# Setup private key for accessing the ceph nodes
cp /vagrant/keys/cephdeploy-key /home/vagrant/.ssh/id_rsa

# SSH config to automatically select the right user
# NOTE: Update this file if adding additional OSD nodes!
cp /vagrant/config /home/vagrant/.ssh/
chown vagrant:vagrant /home/vagrant/.ssh/*
chmod 600 /home/vagrant/.ssh/id_rsa
