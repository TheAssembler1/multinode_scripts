#!/bin/bash

# Check if three arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <prefix of machines> <number of machines>"
    exit 1
fi

prefix_machines="$1"
num_machines="$2"

# Check if the second argument is a number
if ! [[ $num_machines =~ ^[0-9]+$ ]]; then
    echo "Number of machines must be a positive integer."
    exit 1
fi

# Ensure that the SSH public key exists on the source machine
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    echo "You need an SSH key pair on the source machine to copy to the target machines."
    exit 1
fi

# Loop to copy the SSH public key to each target machine
for ((i = 0; i < num_machines; i++)); do
    host="${prefix_machines}${i}"
    ssh-copy-id "$host"
done
