#!/bin/bash

# location:
# /opt/scripts/display-automation/no_auto-off.sh

echo -e "\n\n" >> /opt/log/display-automation.log
date +%F_%H%M%S >> /opt/log/display-automation.log
echo "Did not run auto-off script." >> /opt/log/display-automation.log

#EOF
