#!/bin/bash

# Put this file at "/opt/scripts/getter.sh"
# for use with "file.pl".

# sed command:
# sed 's/[^[:print:]]//g'


cd /opt/data/projstatus

sanyo='sanyoPLC,'
sanyo_power='power,'$sanyo
sanyo_lamps='lampHoursAll,'$sanyo
sanyoPWR='CR0%0D'
sanyoLAMPS='CR3%0D'
panasonic='panasonicPJLink,'
panasonic_power='power,'$panasonic
panasonic_lamps='lampHoursAll,'$panasonic
panasonicPWR='%02QPW%03'
panasonicLAMP1='%02Q$L:1%03'
panasonicLAMP2='%02Q$L:2%03'
panasonicLAMP3='%02Q$L:3%03'
panasonicLAMP4='%02Q$L:4%03'

wcMainHL='http://10.40.30.81/cgi-bin/raw.pl?cmd='
wcMainHR='http://10.40.30.82/cgi-bin/raw.pl?cmd='
wcCatwalk02='http://10.40.30.95/cgi-bin/raw.pl?cmd='
#wcFoldbackHL='http://10.40.30.83/cgi-bin/foldback.pl?cmd='
#wcFoldbackHR='http://10.40.30.84/cgi-bin/foldback.pl?cmd='
wcFoldbackHL='http://10.40.30.83/cgi-bin/raw.pl?cmd='
wcFoldbackHR='http://10.40.30.84/cgi-bin/raw.pl?cmd='

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

echo '' > wcProjs.txt
# blankLine () { echo -e "\n" >> wcProjs.txt; }
# blankLine

# WC Main House Left
echo wc_mainHL,$panasonic_power\
		`curl $wcMainHL$panasonicPWR` >> wcProjs.txt
echo wc_mainHL,$panasonic_lamps\
		`curl $wcMainHL$panasonicLAMP1`\
		`curl $wcMainHL$panasonicLAMP2` >> wcProjs.txt

# WC Main House Right
echo wc_mainHR,$panasonic_power\
		`curl $wcMainHR$panasonicPWR` >> wcProjs.txt
echo wc_mainHR,$panasonic_lamps\
		`curl $wcMainHR$panasonicLAMP1`\
		`curl $wcMainHR$panasonicLAMP2` >> wcProjs.txt

# WC Catwalk 02
echo wc_catwalk02,$sanyo_power\
		`curl $wcCatwalk02$sanyoPWR` >> wcProjs.txt
echo wc_catwalk02,$sanyo_lamps\
		`curl $wcCatwalk02$sanyoLAMPS` >> wcProjs.txt

# WC Foldback House Left
echo wc_foldbackHL,$panasonic_power\
		`curl $wcFoldbackHL$panasonicPWR` >> wcProjs.txt
echo wc_foldbackHL,$panasonic_lamps\
		`curl $wcFoldbackHL$panasonicLAMP1` >> wcProjs.txt

# WC Foldback House Right
echo wc_foldbackHR,$panasonic_power\
		`curl $wcFoldbackHR$panasonicPWR` >> wcProjs.txt
echo wc_foldbackHR,$panasonic_lamps\
		`curl $wcFoldbackHR$panasonicLAMP1` >> wcProjs.txt


# strip some of the goofy characters at
# the beginning of some of these things
sed -i 's/[^[:print:]]//g' wcProjs.txt

# remove spaces after commas
sed -i 's/, /,/g' wcProjs.txt

# finally, now that we're done fiddling,
# move file to where it needs to be for
# the status page to get the data.
mv wcProjs.txt wc-raw.txt

cat /opt/data/projstatus/*-raw.txt | grep , | sed s/'%02'//g | sed s/'%03'//g | sed s/'%0D'//g | sed s/'%0A'//g | sed s/'%00%00%00'//g > dumpstatus.txt
#cat /opt/data/projstatus/*-raw.txt | grep , > dumpstatus.txt

