# Overview

# Usage

First, bring up the physical hardware with:

<pre>
$ vagrant up
</pre>

Once the hardware is up and running properly, create the ceph cluster.

<pre>
$ vagrant ssh cephadminbox
$ ceph-deploy install cephnodebox
</pre>

# Prepare the machines for packaging

From host machine...

<pre>
$ vagrant ssh cephadminbox -c "bash /vagrant/package-prep-internal.sh"
$ vagrant ssh cephnodebox -c "bash /vagrant/package-prep-internal.sh"
</pre>

# Create boxes from VMs

From host machine...

<pre>
$ bash ./create-boxes.sh
</pre>
