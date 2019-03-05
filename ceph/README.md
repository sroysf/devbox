# Overview

Provisions a Ceph storage cluster with following topology:

- cephadmin @ 192.168.50.100
- cephnode1 @ 192.168.50.101

Cluster has 2 OSD's on cephnode1

# Usage

First, bring up the physical hardware with:

<pre>
$ vagrant up
</pre>

Once the hardware is up and running properly, create the ceph cluster.

<pre>
$ vagrant ssh cephadmin
$ bash /vagrant/create-ceph-cluster.sh
</pre>

If all goes well, you should ultimately see some messages indicating a healthy cluster.
