#!/bin/bash

# Put this file at "/opt/scripts/getter.sh"
# for use with "file.pl".

cd /opt/data/projstatus

wget -O bridge-raw.txt http://10.40.30.75/bridge_status.html
wget -O chapel-raw.txt http://10.40.30.70/chapel_status.html
wget -O gym-raw.txt http://10.40.30.65/gym_status.html

wget -O well-raw.txt http://10.40.30.130/well_status.html
wget -O rm128-raw.txt http://10.40.30.128/room-128_status.html
wget -O rm104-raw.txt http://10.40.30.104/room-104_status.html
wget -O rm102-raw.txt http://10.40.30.102/room-102_status.html
wget -O rmRR1-raw.txt http://10.40.30.60/room-rr1_status.html

wget -O rm101a-raw.txt http://10.40.30.98/room-101a_status.html
wget -O rm101c-raw.txt http://10.40.30.101/room-101c_status.html
wget -O rm212-raw.txt http://10.40.30.212/room-212_status.html
wget -O rm214-raw.txt http://10.40.30.214/room-214_status.html
wget -O rm216-raw.txt http://10.40.30.216/room-216_status.html

cat /opt/data/projstatus/*-raw.txt | grep , | sed s/'%02'//g | sed s/'%03'//g | sed s/'%0D'//g | sed s/'%0A'//g > dumpstatus.txt
#cat /opt/data/projstatus/*-raw.txt | grep , > dumpstatus.txt
