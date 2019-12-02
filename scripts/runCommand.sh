#!/bin/bash

# Assign values
if [ ! -z "$1" ]; then
    command=$1
else
    command="echo Connected"
fi

if [ ! -z "$2" ]; then 
    firstIP=$2
else
    firstIP=179 # ertis25
fi

if [ ! -z "$3" ]; then
    lastIP=$3
else
    lastIP=226 # ertis48
fi

# Function
for i in $(seq $firstIP 1 $lastIP)
do
    ssh ertis@"192.168.49.${i}" "echo RUNNING COMMAND ON 192.168.49.${i}:; $command"
done