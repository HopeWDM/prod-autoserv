#!/bin/bash

# file location:
# /opt/scripts/display-status/run-constantly-running.sh

kill -KILL `ps -A | grep -i constantly-run`
sleep 3
kill -KILL `ps -A | grep -i constantly-run`
sleep 3
/opt/scripts/display-status/constantly-running.sh &
exit
