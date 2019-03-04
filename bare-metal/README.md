# Overview

Provides several "bare-metal" hosts, networked together on a private network.

- master @ 192.168.50.10
- node1  @ 192.168.50.11

# Features

- Docker CE v.18.09.3.3
- Containerd v.1.2.4-1
- Docker Compose v.1.23.2
- Single pull-through caching local Docker registry for all cluster nodes
- Envoy latest binary pre-installed on every node
