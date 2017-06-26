#!/bin/sh
#
# Script for setting and checking network overlay configuration on master.
#
##########################################################################

# Getting network status. 
statusNetwork="`etcdctl ls /kube-centos/network`"

# Setting network overlay configuration.
function networkConfig {
  etcdctl mkdir /kube-centos/networ
  etcdctl mk /kube-centos/network/config "{ \"Network\": \"172.30.0.0/16\", \"SubnetLen\": 24, \"Backend\": { \"Type\": \"vxlan\" } }"
}

# Checking network overlay configuration.
if [ "`echo ${statusNetwork} | grep subnets`" = ""  ] ; then
  networkConfig
fi  

if [ "`echo ${statusNetwork} | grep config`" = ""  ] ; then
  networkConfig
fi  

