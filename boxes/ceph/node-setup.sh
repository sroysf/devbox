#!/bin/bash

echo "Provisioning ceph nodes"
apt-get install -y python-minimal

# Setup user for ceph deploy ssh access
export CEPH_USER=cephdeploy
sudo useradd -d /home/${CEPH_USER} ${CEPH_USER}
echo "${CEPH_USER} ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/${CEPH_USER}
sudo chmod 0440 /etc/sudoers.d/${CEPH_USER}

mkdir /home/cephdeploy
mkdir /home/cephdeploy/.ssh
cat /vagrant/keys/cephdeploy-key.pub >> ~cephdeploy/.ssh/authorized_keys
chown -R cephdeploy:cephdeploy /home/cephdeploy
chmod 644 ~cephdeploy/.ssh/authorized_keys
