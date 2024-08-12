#!/usr/bin/bash 

ip link set dev eth0 promisc on

ip add sh eth0

ethtool -K eth0 gro off lro off

/usr/local/bin/snort -c /usr/local/etc/snort/snort.lua -s 65535 -k none -l /var/log/snort -D -i eth0 -m 0x1b -u root -g root

