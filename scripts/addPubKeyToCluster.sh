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

if [ ! -z "$3" ]; then # Public key path to add
    path=$3
else
    path="id_rsa.pub"
fi

# Function
pubkey=$(cat $path) 2> /dev/null
if [ ! -z "$pubkey" ]; then
    for i in $(seq $firstIP 1 $lastIP)
    do
        ssh ertis@"192.168.49.${i}" "echo ${pubkey}>> .ssh/authorized_keys"
    done
else
    echo "Error: Pub Key not found." >&2; exit 1
fi
