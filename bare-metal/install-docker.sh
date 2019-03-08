#!/bin/bash

echo "===================================================="
echo "    Installing Docker Infrastructure"
echo "===================================================="

# ==========================
# Download Docker packages
# ==========================
wget -nv https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_18.09.3~3-0~ubuntu-xenial_amd64.deb
wget -nv https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce-cli_18.09.3~3-0~ubuntu-xenial_amd64.deb
wget -nv https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/containerd.io_1.2.4-1_amd64.deb

# ==========================
# Install Docker
# ==========================
dpkg -i containerd.io_1.2.4-1_amd64.deb
dpkg -i docker-ce-cli_18.09.3~3-0~ubuntu-xenial_amd64.deb
dpkg -i docker-ce_18.09.3~3-0~ubuntu-xenial_amd64.deb
usermod -a -G docker vagrant

# ==========================
# Install Docker Compose
# ==========================
curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# ==================================================
# Setup Docker daemon to use local registry proxy
# ==================================================
cp /vagrant/docker-daemon.json /etc/docker/daemon.json
service docker restart
