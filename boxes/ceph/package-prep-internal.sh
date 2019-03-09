#!/bin/bash

echo "Cleaning out apt cache"
sudo apt-get clean

echo "Zeroing out drives"
sudo dd if=/dev/zero of=/EMPTY bs=1M

echo "Cleaning up empty file"
sudo rm -f /EMPTY

echo "Setting keys"
curl https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub >> ~/.ssh/authorized_keys

echo "Clearing bash history"
cat /dev/null > ~/.bash_history && history -c && exit
