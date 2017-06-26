#!/bin/sh

etcdctl ls /kube-centos/network 2&> /tmp/etcdctl-tmp.log 

if [ "`cat /tmp/etcdctl-tmp.log | grep Error:`" != "" ] ; then 
   etcdctl mkdir /kube-centos/network
   etcdctl mk /kube-centos/network/config "{ \"Network\"":" \"172.30.0.0/16\", \"SubnetLen\"":" 24, \"Backend\"":" { \"Type\"":" \"vxlan\" } }"
fi

rm /tmp/etcdctl-tmp.log
