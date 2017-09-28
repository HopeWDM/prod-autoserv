  #!/bin/bash
  
  # location:
  # /opt/scripts/kipro-automation/stop.sh
  
  /opt/kipro-python/stop.py 10.40.31.122
  /opt/kipro-python/stop.py 10.40.31.123
  echo -e "\n\n" >> /opt/log/kipro-automation.log
  date +%F_%H%M%S >> /opt/log/kipro-automation.log
  echo "Ran KiPro STOP." >> /opt/log/kipro-automation.log
  
  #EOF
