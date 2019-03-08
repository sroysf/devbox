#!/bin/bash

echo "Make sure this command is run as root"

bash /vagrant/kube-reset.sh

echo "--------------------------------------------"
echo "Deploying Kubernetes"
export PRIVATE_IP=$(ifconfig | grep 192.168 | awk -F  ":" '/192.168/ {print $2}' | cut -f1 -d' ')
export NODE_NAME=$(hostname -s)
echo "Using Private IP ${PRIVATE_IP}, Node name ${NODE_NAME}"
rm kubeinit.log
kubeadm init --pod-network-cidr=192.168.50.0/24 --apiserver-advertise-address=${PRIVATE_IP} --apiserver-cert-extra-sans=${PRIVATE_IP} --node-name ${NODE_NAME} | tee kubeinit.log
bash /vagrant/generate-join-script.sh
