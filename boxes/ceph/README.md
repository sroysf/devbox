# Overview

# Usage

First, bring up the physical hardware with:

<pre>
$ vagrant up
</pre>

# Prepare the machines for packaging

From host machine...

<pre>
$ vagrant ssh cephnodebox -c "bash /vagrant/package-prep-internal.sh"
</pre>

# Create box from VMs

From host machine...

<pre>
$ bash ./create-boxes.sh
</pre>
