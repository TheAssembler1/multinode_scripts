#!/bin/bash

# Check if four arguments are provided
if [ $# -ne 4 ]; then
    echo "Usage: $0 <prefix of machines> <number of machines> <path_to_file_or_folder> <path_to_destination_file_or_folder>"
    exit 1
fi

prefix_machines="$1"
num_machines="$2"
path_to_file_or_folder="$3"
path_to_destination_file_or_folder="$4"

# Check if the second argument is a number
if ! [[ $num_machines =~ ^[0-9]+$ ]]; then
    echo "Number of machines must be a positive integer."
    exit 1
fi

# Loop to transfer the file or folder to each target machine
for ((i = 0; i < num_machines; i++)); do
    host="${prefix_machines}${i}"
    scp -r "$path_to_file_or_folder" "$path_to_destination_file_or_folder"
done
