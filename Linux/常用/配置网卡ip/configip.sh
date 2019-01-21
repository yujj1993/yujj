#!/bin/bash
read -p "interface: " ifname
read -p "ip address: " ipaddr
read -p "prefix: " prefix
read -p "gatway: " gateway
read -p "dns: " dns
ipfile=/etc/sysconfig/network-scrpts/ifcfg-$ifname
#ipfile=/tmp/ifcfg-$ifname
cat <<EOF >$ipfile
DEVICE=$ifname
ONBOOT=yes
IPV6INIT=no
BOOTPROTO=none
IPADDR=$ipaddr
PREFIX=$prefix
EOF
if [ -n "$gateway" ];then
sed -i "\$aGATEWAY=$gateway" $ipfile
fi
if [ -n "$dns" ];then
sed -i "\$aDNS=$dns" $ipfile
fi
