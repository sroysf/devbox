#!/bin/bash

echo "--------------------------------------------"
echo "Resetting kubernetes installation"
kubeadm reset
iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X
