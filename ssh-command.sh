#!/bin/bash

# Check if three arguments are provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <prefix of machines> <number of machines> <command>"
    exit 1
fi

prefix_machines="$1"
num_machines="$2"
command_to_execute="$3"

# Check if the second argument is a number
if ! [[ $num_machines =~ ^[0-9]+$ ]]; then
    echo "Number of machines must be a positive integer."
    exit 1
fi

for ((i = 0; i < num_machines; i++)); do
    host="${prefix_machines}${i}"
    ssh -t "$host" "$command_to_execute"
done
