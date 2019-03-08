#!/bin/bash

echo "===================================================="
echo "    Installing Envoy Proxy"
echo "===================================================="

# ================================================================================
# Extract envoy binary and install on base VM, for non-Dockerized usage scenarios
# ================================================================================
docker run -v /home/vagrant:/home/vagrant -i envoyproxy/envoy /bin/bash -c 'cp $(which envoy) /home/vagrant/'
mv /home/vagrant/envoy /usr/local/bin/
