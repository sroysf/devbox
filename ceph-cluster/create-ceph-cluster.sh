#!/bin/bash

# ============================================
# Initialize Ceph cluster with 1 node, 2 OSDs
# http://docs.ceph.com/docs/luminous/start/quick-ceph-deploy/

function nodeConf {
  CEPH_NODE=$1
  echo "Configuring OSD : ${CEPH_NODE}"
  ceph-deploy disk zap ${CEPH_NODE} /dev/sdc
  ceph-deploy osd create ${CEPH_NODE} --data /dev/sdc
}


export CEPH_NODE="cephnode1"
mkdir my-cluster
cd my-cluster
ceph-deploy new cephnode1
ceph-deploy mon create-initial
ceph-deploy admin cephnode1 cephnode2 cephnode3
ceph-deploy mgr create cephnode1
nodeConf cephnode1
nodeConf cephnode2
nodeConf cephnode3

echo "Ceph cluster initial health: $(ssh cephnode1 sudo ceph health)"

ceph-deploy rgw create cephnode1
ceph-deploy mds create cephnode1

ceph-deploy mon add cephnode2 cephnode3
ceph-deploy mgr create cephnode2 cephnode3

echo "Ceph cluster health after full setup: $(ssh cephnode1 sudo ceph health)"
echo "Ceph cluster detailed view:"
ssh cephnode1 sudo ceph -s
