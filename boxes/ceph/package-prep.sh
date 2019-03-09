#!/bin/bash

echo "Cleaning out apt cache"
CMD="sudo apt-get clean"
vagrant ssh cephadmin -c "${CMD}"
vagrant ssh cephnode1 -c "${CMD}"

echo "Zeroing out drives"
CMD="sudo dd if=/dev/zero of=/EMPTY bs=1M && sudo rm -f /EMPTY"
vagrant ssh cephadmin -c "${CMD}"
vagrant ssh cephnode1 -c "${CMD}"

echo "Clearing bash history"
CMD="cat /dev/null > ~/.bash_history && history -c && exit"
vagrant ssh cephadmin -c "${CMD}"
vagrant ssh cephnode1 -c "${CMD}"
