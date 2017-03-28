#!/bin/bash

# location:
# /var/www/cgi-bin/archive-log.sh
echo 'Content-type: text/html'
echo -e "\n\n"

cp /var/www/html/log/display-automation.log /opt/log/archive/display-automation_`date +%F_%H%M%S`.log
echo '' > /var/www/html/log/display-automation.log
echo -e "\n\n" >> /opt/log/display-automation.log
date +%F_%H%M%S >> /opt/log/display-automation.log
echo "Archived previous log entries." >> /opt/log/display-automation.log
#EOF
