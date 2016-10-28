#!/bin/bash

# location:
# /var/www/cgi-bin/archive-log.sh
echo 'Content-type: text/html'
echo -e "\n\n"

cp /var/www/html/log/projector-automation.log /opt/log/archive/projector-automation_`date +%F_%H%M%S`.log
echo '' > /var/www/html/log/projector-automation.log
echo -e "\n\n" >> /opt/log/projector-automation.log
date +%F_%H%M%S >> /opt/log/projector-automation.log
echo "Archived previous log entries." >> /opt/log/projector-automation.log
#EOF