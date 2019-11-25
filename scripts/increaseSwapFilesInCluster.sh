#!/bin/bash

# Assign values
if [ ! -z "$1" ]; then 
    firstIP=$1
else
    firstIP=179 # ertis1
fi

if [ ! -z "$2" ]; then
    lastIP=$2
else
    lastIP=202 # ertis24
fi

if [ ! -z "$3" ]; then # Total MB to add
    mb=$3
else
    mb=3072 # 3G
fi

# Function
for i in $(seq $firstIP 1 $lastIP)
do
    ssh -t ertis@"192.168.49.${i}" "sudo swapoff /swap 2> /dev/null; sudo dd if=/dev/zero of=/swap bs=1M count=${mb}; sudo mkswap /swap; sudo swapon /swap; sudo chmod 777 /etc/fstab; sudo echo '/swap          none  swap sw       0 0' >> /etc/fstab; sudo chmod 644 /etc/fstab; sudo reboot"
done
