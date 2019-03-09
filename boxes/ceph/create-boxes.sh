#!/bin/bash

echo "Exporting boxes"
vagrant package --base cephnode1 --output cephnode.box
vagrant package --base cephadmin --output cephadmin.box

echo "Installing boxes"
vagrant box remove sroysf/cephnode
vagrant box add sroysf/cephnode cephnode.box

vagrant box remove sroysf/cephadmin
vagrant box add sroysf/cephadmin cephadmin.box
