# Overview

Provides several "bare-metal" hosts, networked together on a private network.

- master @ 192.168.50.10
- node1  @ 192.168.50.11

# Features

## Out of the box

- Docker CE v.18.09.3.3
- Containerd v.1.2.4-1
- Docker Compose v.1.23.2
- Single pull-through caching local Docker registry for all cluster nodes
- Envoy latest binary pre-installed on every node
- Kubernetes latest version

## Optional

- Multi-node Kubernetes cluster setup

# Setting up Kubernetes cluster

Setting up the Kubernetes cluster requires some minimal manual steps.

## Step 1 - Initialize Kubernetes

**Important** : Run kubeadm-init.sh as root user

<pre>
$ vagrant ssh master
$ sudo su -
$ bash /vagrant/kubeadm-init.sh
</pre>

## Step 2 - Install Pod network

**Important** : Run deploy-pod-network.sh as vagrant user

<pre>
$ vagrant ssh master
$ bash /vagrant/deploy-pod-network.sh
</pre>

## Step 3 - Add worker nodes

**Important** : Run join-cmd.sh as root user

Repeat for each node[n] machine:

<pre>
$ vagrant ssh node1
$ sudo su -
$ bash /vagrant/join-cmd.sh
</pre>

# Troubleshooting

## Kubernetes - starting over

To reset everything related to Kubernetes setup:

**Important** : Run kube-reset.sh as root user

Repeat for all machines, including master:

<pre>
$ vagrant ssh master
$ sudo su -
$ bash /vagrant/kube-reset.sh
</pre>
