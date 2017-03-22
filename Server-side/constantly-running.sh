#!/bin/bash

# this file should live at:
# /opt/scripts/display-status/constantly-running.sh


i="0"

while [ $i -eq 0 ]
do
	/opt/scripts/file.pl > /var/www/html/javascript/status_vars.js
	sleep 3
done
