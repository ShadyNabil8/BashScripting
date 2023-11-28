#!/bin/bash

####################################################################
####################################################################
# This script is used to check for the available IPs on this network
####################################################################
####################################################################

####################################################################
############################# Arguments ############################
####################################################################
# How many time to ping a single ip
REPEAT=$1
# Time to wait for the response
TIMEOUT=$2
# How many ips want to be checked
COUNT=$3
####################################################################
####################################################################

LOCAL="192.168.1."
PACKET_LOSS=" 0% packet"

if [ $# -lt 3 ]; then
    echo "WRONG ARGUMENTS!!"
    exit -1
fi

for ((ip = 1; ip <= COUNT; ip++)); do
    response=$(ping ${LOCAL}${ip} -c$REPEAT -w$TIMEOUT)
    #echo ${response}
    if [[ ${response} = *${PACKET_LOSS}* ]]; then
        echo "=========================="
        echo "||${LOCAL}${ip}: CONNECTED||"
        echo "=========================="
    else
        echo "${LOCAL}${ip} NOT CONNECTED"
    fi
done
