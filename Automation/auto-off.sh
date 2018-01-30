#!/bin/bash

# location:
# /opt/scripts/projector-automation/auto-off.sh

# -----
# Worship Center
# -----

# mainLeft / Panasonic
wget -o /dev/null -O /dev/null "http://10.40.30.81/cgi-bin/raw.pl?cmd=%02POF%03"

# mainRight / Panasonic
wget -o /dev/null -O /dev/null "http://10.40.30.82/cgi-bin/raw.pl?cmd=%02POF%03"

# Foldback Left / Sanyo
wget -o /dev/null -O /dev/null "http://10.40.30.83/cgi-bin/raw.pl?cmd=C01%0D"

# Foldback Right / Sanyo
wget -o /dev/null -O /dev/null "http://10.40.30.84/cgi-bin/raw.pl?cmd=C01%0D"

# centerCenter / Panasonic
wget -o /dev/null -O /dev/null "http://10.40.30.95/cgi-bin/raw.pl?cmd=%02POF%03"

# Video Control / LG Display
wget -o /dev/null -O /dev/null "http://10.40.30.94/cgi-bin/raw.pl?cmd=ka 0 0%0D"
wget -o /dev/null -O /dev/null "http://10.40.30.109/cgi-bin/raw.pl?cmd=ka 0 0%0D"

# -----
# Bridge
# -----

# mainLeft / Panasonic
wget -o /dev/null -O /dev/null "http://10.40.30.75/file.html?cmd=W01RS|%02POF%03"

# mainRight / Panasonic
wget -o /dev/null -O /dev/null "http://10.40.30.75/file.html?cmd=W02RS|%02POF%03"

# mainCenter / Sanyo
wget -o /dev/null -O /dev/null "http://10.40.30.75/file.html?cmd=W03RS|C01%0D"

# foldbackCenter / Sanyo
wget -o /dev/null -O /dev/null "http://10.40.30.75/file.html?cmd=W04RS|C01%0D"

# ***** ***** *****
# ***** ***** *****



# -----
# Chapel:
# -----

# foldbackSide / lgTV
wget -o /dev/null -O /dev/null "http://10.40.30.70/file.html?cmd=W04RS|ka%200%2000%0D"

# mainSide / Panasonic
wget -o /dev/null -O /dev/null "http://10.40.30.70/file.html?cmd=W01RS|%02POF%03"

# mainCenter / Sanyo
wget -o /dev/null -O /dev/null "http://10.40.30.70/file.html?cmd=W02RS|C01%0D"

# ***** ***** *****
# ***** ***** *****



# -----
# Gym
# -----

# mainSide / Sanyo
wget -o /dev/null -O /dev/null "http://10.40.30.65/file.html?cmd=W01RS|C01%0D"

# ***** ***** *****
# ***** ***** *****



# -----
# The Well/Room 130
# -----

# mainCenter / Panasonic
wget -o /dev/null -O /dev/null "http://10.40.30.130/file.html?cmd=W01RS|%02POF%03"

# mainOne / LG TV
wget -o /dev/null -O /dev/null "http://10.40.30.130/file.html?cmd=W03RS|ka%20%30%20%30%OD"

# mainTwo / LG TV
wget -o /dev/null -O /dev/null "http://10.40.30.130/file.html?cmd=W04RS|ka%20%30%20%30%OD"

# mainThree / LG TV
wget -o /dev/null -O /dev/null "http://10.40.30.130/file.html?cmd=W05RS|ka%20%30%20%30%OD"

# foldbackTV / LG TV
wget -o /dev/null -O /dev/null "http://10.40.30.130/file.html?cmd=W06RS|ka%20%30%20%30%OD"

# ***** ***** *****
# ***** ***** *****



# -----
# Room 101A
# -----

# mainCenter / Panasonic
wget -o /dev/null -O /dev/null "http://10.40.30.98/file.html?cmd=W02RS|%02POF%03" // projector off
wget -o /dev/null -O /dev/null "http://10.40.30.98/file.html?cmd=W01%2C1%2C1%2C0IR%7C" // screen up
wget -o /dev/null -O /dev/null "http://10.40.30.98/file.html?cmd=W00000008LC%7C" // Extron LEDs changed

# ***** ***** *****
# ***** ***** *****



## -----
## Room 101B
## -----
#
## mainCenter / Panasonic
#wget -o /dev/null -O /dev/null "http://10.40.30.99/file.html?cmd=W02RS|%02POF%03" // projector off
#wget -o /dev/null -O /dev/null "http://10.40.30.99/file.html?cmd=W01%2C1%2C1%2C0IR%7C" // screen up
#wget -o /dev/null -O /dev/null "http://10.40.30.99/file.html?cmd=W00000008LC%7C" // Extron LEDs changed
#
## ***** ***** *****
## ***** ***** *****

# -----
# Room 101C
# -----

# mainCenter / Panasonic
wget -o /dev/null -O /dev/null "http://10.40.30.101/file.html?cmd=W02RS|%02POF%03" // projector off
wget -o /dev/null -O /dev/null "http://10.40.30.101/file.html?cmd=W01%2C1%2C1%2C0IR%7C" // screen up
wget -o /dev/null -O /dev/null "http://10.40.30.101/file.html?cmd=W00000008LC%7C" // Extron LEDs changed

# ***** ***** *****
# ***** ***** *****



# -----
# Room 102
# -----

# mainCenter / Panasonic
wget -o /dev/null -O /dev/null "http://10.40.30.102/file.html?cmd=W02RS|%02POF%03" // projector off
wget -o /dev/null -O /dev/null "http://10.40.30.102/file.html?cmd=W01%2C1%2C1%2C0IR%7C" // screen up
wget -o /dev/null -O /dev/null "http://10.40.30.102/file.html?cmd=W00000008LC%7C" // Extron LEDs changed

# ***** ***** *****
# ***** ***** *****



# -----
# Room 104
# -----

# mainCenter / Panasonic
wget -o /dev/null -O /dev/null "http://10.40.30.104/file.html?cmd=W02RS|%02POF%03" // projector off
wget -o /dev/null -O /dev/null "http://10.40.30.104/file.html?cmd=W01%2C1%2C1%2C0IR%7C" // screen up
wget -o /dev/null -O /dev/null "http://10.40.30.104/file.html?cmd=W00000008LC%7C" // Extron LEDs changed

# ***** ***** *****
# ***** ***** *****



# -----
# Room 128
# -----

# mainCenter / Panasonic
wget -o /dev/null -O /dev/null "http://10.40.30.128/file.html?cmd=W02RS|%02POF%03" // projector off
wget -o /dev/null -O /dev/null "http://10.40.30.128/file.html?cmd=W01%2C1%2C1%2C0IR%7C" // screen up
wget -o /dev/null -O /dev/null "http://10.40.30.128/file.html?cmd=W00000008LC%7C" // Extron LEDs changed

# ***** ***** *****
# ***** ***** *****



# -----
# Room 212
# -----

# mainCenter / Sanyo
wget -o /dev/null -O /dev/null "http://10.40.30.212/file.html?cmd=W02RS|C01%0D" // projector off
wget -o /dev/null -O /dev/null "http://10.40.30.212/file.html?cmd=W01%2C1%2C1%2C0IR%7C" // screen up
wget -o /dev/null -O /dev/null "http://10.40.30.212/file.html?cmd=W00000008LC%7C" // Extron LEDs changed

# ***** ***** *****
# ***** ***** *****



# -----
# Room 214
# -----

# mainCenter / Sanyo
wget -o /dev/null -O /dev/null "http://10.40.30.214/file.html?cmd=W02RS|C01%0D" // projector off
wget -o /dev/null -O /dev/null "http://10.40.30.214/file.html?cmd=W01%2C1%2C1%2C0IR%7C" // screen up
wget -o /dev/null -O /dev/null "http://10.40.30.214/file.html?cmd=W00000008LC%7C" // Extron LEDs changed

# ***** ***** *****
# ***** ***** *****



# -----
# Room 216
# -----

# mainCenter / Sanyo
wget -o /dev/null -O /dev/null "http://10.40.30.216/file.html?cmd=W02RS|C01%0D" // projector off
wget -o /dev/null -O /dev/null "http://10.40.30.216/file.html?cmd=W01%2C1%2C1%2C0IR%7C" // screen up
wget -o /dev/null -O /dev/null "http://10.40.30.216/file.html?cmd=W00000008LC%7C" // Extron LEDs changed

# ***** ***** *****
# ***** ***** *****



# -----
# Room RR1
# -----

# mainCenter / Sanyo
wget -o /dev/null -O /dev/null "http://10.40.30.60/file.html?cmd=W01RS|C01%0D" // projector off
# wget -o /dev/null -O /dev/null "http://10.40.30.60/file.html?cmd=W01%2C1%2C1%2C0IR%7C" // screen up // NO SCREEN MOTOR
wget -o /dev/null -O /dev/null "http://10.40.30.60/file.html?cmd=W00000008LC%7C" // Extron LEDs changed

# ***** ***** *****
# ***** ***** *****

#EOF
