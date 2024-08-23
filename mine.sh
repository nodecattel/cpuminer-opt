#!/bin/bash

# Function to print prompts in green
green_prompt() {
    echo -e "\033[0;32m$1\033[0m"
}

# Prompt for BTC address
green_prompt "Enter your BTC address:"
read -p "BTC Address: " btc_address

# Prompt for the number of threads, defaulting to 48
green_prompt "Enter the number of threads to use for mining (default: 8):"
read -p "Threads: " num_threads
num_threads=${num_threads:-8}

# Set the default pool URL
pool_url="stratum+tcp://fb.nodecattel.xyz:3333"

# Confirm with the user before starting
green_prompt "Starting cpuminer with the following settings:"
echo "  BTC Address: $btc_address"
echo "  Pool URL: $pool_url"
echo "  Threads: $num_threads"

# Run the cpuminer command
./cpuminer -a sha256d -o $pool_url -u $btc_address -p x -t $num_threads
