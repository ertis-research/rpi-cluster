#!/bin/bash

# Assign values
if [ ! -z "$1" ]; then # Public key path to add
    path=$1
else
    path="id_rsa.pub"
fi

if [ ! -z "$2" ]; then 
    firstIP=$2
else
    firstIP=179 # ertis1
fi

if [ ! -z "$3" ]; then
    lastIP=$3
else
    lastIP=226 # ertis48
fi

# Function
pubkey=$(cat $path) 2> /dev/null
if [ ! -z "$pubkey" ]; then
    for i in $(seq $firstIP 1 $lastIP)
    do
        ssh -t ertis@"192.168.49.${i}" "echo ${pubkey}>> .ssh/authorized_keys"
    done
else
    echo "Error: Pub Key not found." >&2; exit 1
fi
