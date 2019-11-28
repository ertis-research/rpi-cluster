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

if [ ! -z "$3" ]; then
    command=$3
else
    command="echo Connected"
fi

# Function
for i in $(seq $firstIP 1 $lastIP)
do
    ssh ertis@"192.168.49.${i}" "echo RUNNING COMMAND ON 192.168.49.${i}:; $command"
done