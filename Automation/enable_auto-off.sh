#!/bin/bash

# location:
# /var/www/cgi-bin/enable_auto-off.sh
echo 'Content-type: text/html'
echo -e "\n\n"

cp /var/www/html/javascript/auto-off_enabled.txt /var/www/html/javascript/auto-off.js

echo -e "\n\n" >> /opt/log/display-automation.log
date +%F_%H%M%S >> /opt/log/display-automation.log
echo "Enabled auto-off." >> /opt/log/display-automation.log
#EOF
