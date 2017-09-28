#!/bin/bash

# location:
# /opt/scripts/kipro-automation/record.sh

/opt/kipro-python/record.py 10.40.31.122
/opt/kipro-python/record.py 10.40.31.123
echo -e "\n\n" >> /opt/log/kipro-automation.log
date +%F_%H%M%S >> /opt/log/kipro-automation.log
echo "Ran KiPro RECORD." >> /opt/log/kipro-automation.log

#EOF
