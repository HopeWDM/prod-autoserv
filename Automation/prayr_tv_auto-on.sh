#!/bin/bash

# location:
# /opt/scripts/projector-automation/prayr_tv_auto-on.sh


# -----
# Prayer Room TVs
# ON Command
# -----

# Jordan Creek Prayer Room
wget -o /dev/null -O /dev/null "http://10.40.30.111/cgi-bin/raw.pl?cmd=%02PON%03"
# Ashworth Prayer Room
wget -o /dev/null -O /dev/null "http://10.40.30.112/cgi-bin/raw.pl?cmd=%02PON%03"
# Nursing Mothers TV /
wget -o /dev/null -O /dev/null "http://10.40.30.113/cgi-bin/raw.pl?cmd=ka%200%201%0D"

# EOF
