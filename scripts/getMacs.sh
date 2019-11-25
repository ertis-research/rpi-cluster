#!/bin/bash

# Assign values
if [ ! -z "$1" ]; then 
    firstIP=$1
else
    firstIP=203 # ertis25
fi

if [ ! -z "$2" ]; then
    lastIP=$2
else
    lastIP=226 # ertis48
fi

# Function
echo "" > macs.txt
for i in $(seq $firstIP 1 $lastIP)
do
    ssh ertis@"192.168.49.${i}" "cat /sys/class/net/eth0/address" >> macs.txt
done
cat macs.txt
