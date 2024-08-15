#/bin/bash

[ -f "/opt/splunkforwarder/ftr" ] && rm /opt/splunkforwarder/ftr
/opt/splunkforwarder/bin/splunk add user thisisnotme -password '7te%4:V9!$4,' -role admin -auth admin
:changeme
/opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --no-prompt --seed-passwd
 'F$4X3W@2*8yhJ'

