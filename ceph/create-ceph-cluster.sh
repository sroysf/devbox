#!/bin/bash

# ============================================
# Initialize Ceph cluster with 1 node, 2 OSDs
# http://docs.ceph.com/docs/luminous/start/quick-ceph-deploy/

export CEPH_NODE="cephnode1"
mkdir my-cluster
cd my-cluster
ceph-deploy new ${CEPH_NODE}
ceph-deploy install ${CEPH_NODE}
ceph-deploy mon create-initial
ceph-deploy admin ${CEPH_NODE}
ceph-deploy mgr create ${CEPH_NODE}
ceph-deploy disk zap ${CEPH_NODE} /dev/sdc
ceph-deploy disk zap ${CEPH_NODE} /dev/sdd
ceph-deploy osd create ${CEPH_NODE} --data /dev/sdc


ceph-deploy mgr create ${CEPH_NODE}
ceph-deploy rgw create ${CEPH_NODE}


echo "Ceph cluster health: $(ssh ${CEPH_NODE} sudo ceph health)"
echo "Ceph cluster detailed view:"
ssh ${CEPH_NODE} sudo ceph -s
