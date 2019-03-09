#!/bin/bash

echo "Removing old boxes"
rm *.box

echo "Exporting boxes"
vagrant package --base cephnodebox --output cephnode.box
vagrant package --base cephadminbox --output cephadmin.box

echo "Replacing boxes"
vagrant box remove sroysf/cephnode
vagrant box add sroysf/cephnode cephnode.box

vagrant box remove sroysf/cephadmin
vagrant box add sroysf/cephadmin cephadmin.box

echo "Available boxes:"
vagrant box list
