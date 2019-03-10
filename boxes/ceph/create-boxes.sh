#!/bin/bash

echo "Removing old boxes"
rm *.box

echo "Exporting boxes"
vagrant package --base cephnodebox --output cephnode.box

echo "Replacing boxes"
vagrant box remove sroysf/cephnode
vagrant box add sroysf/cephnode cephnode.box

echo "Available boxes:"
vagrant box list
