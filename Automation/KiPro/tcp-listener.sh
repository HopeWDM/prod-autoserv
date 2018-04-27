#!/bin/bash

while [ 1 == 1 ]
do
MYVAR=`nc -l 1234`
echo "received $MYVAR"
	if [[ $MYVAR == "stop" ]];
	then
		/path/to/stop.py
	elif [[ $MYVAR == "start" ]];
	then
		/path/to/start.py
	fi
done
