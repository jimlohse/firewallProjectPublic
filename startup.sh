#!/usr/bin/bash 

ip link set dev eth0 promisc on

ip add sh eth0

ethtool -K eth0 gro off lro off



/usr/local/bin/snort -Q --daq nfq -c /etc/snort/snort.lua -s 65535 -k all -l /var/log/snort -A alert_fast --rule-path /etc/snort/rules/emerging3 -D -i eth0 -m 0x1b -u root -g root

# /usr/local/bin/snort -Q --daq nfq -c /etc/snort/snort.lua -s 65535 -k none -l /var/log/snort -A alert_fast --rule-path /etc/snort/rules/emerging3 -D -m 0x1b -u root -g root

