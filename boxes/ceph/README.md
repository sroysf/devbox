# Overview

# Usage

First, bring up the physical hardware with:

<pre>
$ vagrant up
</pre>

Once the hardware is up and running properly, create the ceph cluster.

<pre>
$ vagrant ssh cephadmin
$ ceph-deploy install cephnode1
</pre>

# Prepare the machines for packaging

<pre>
$ bash ./package-prep.sh
</pre>

# Create boxes from VMs

<pre>
$ bash ./create-boxes.sh
</pre>
