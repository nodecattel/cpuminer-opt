#!/bin/bash

# Display the logo in orange
echo -e "\033[0;33m"
echo "   ________)                     __     __)              "
echo "  (, /                       /) (, /|  /|   ,            "
echo "    /___, __  _   _ _/_ _   //    / | / |    __    _  __ "
echo " ) /     / (_(_(_(__(__(_(_(/_ ) /  |/  |__(_/ (__(/_/ (_"
echo "(_/                           (_/   '                    "
echo -e "\033[0m"

# Display credits in default color
echo "cpuminer-opt is a fork of cpuminer-multi by TPruvot with"
echo "optimizations imported from other miners developed by"
echo "lucas Jones, djm34, Wolf0, pooler, Jeff garzik, ig0tik3d,"
echo "elmad, palmd, and Optiminer, with additional optimizations"
echo "by Jay D Dee."

# Config file location
config_file="mine.conf"

# Load existing configuration if the config file exists
if [[ -f "$config_file" ]]; then
    source "$config_file"
else
    # Set defaults if config file does not exist
    pool_url="stratum+tcp://fb.nodecattel.xyz:3333"
    btc_address=""
    num_threads=""
fi

# Prompt the user to enter a pool URL or use the existing/default
echo -e "\033[0;33mEnter the mining pool URL (default: $pool_url):\033[0m"
read -r input_pool_url
pool_url=${input_pool_url:-$pool_url}

# Prompt the user to enter their BTC address or use the existing
echo -e "\033[0;33mEnter your BTC address (current: $btc_address):\033[0m"
read -r input_btc_address
btc_address=${input_btc_address:-$btc_address}

# Prompt the user to enter the number of threads to use for mining or use the existing
echo -e "\033[0;33mEnter the number of threads to use for mining (current: $num_threads):\033[0m"
read -r input_num_threads
num_threads=${input_num_threads:-$num_threads}

# Set the password to 'x' as per user preference
mining_pass="x"

# Save the configuration to the config file
echo "pool_url=\"$pool_url\"" > "$config_file"
echo "btc_address=\"$btc_address\"" >> "$config_file"
echo "num_threads=\"$num_threads\"" >> "$config_file"

# Run the cpuminer command with the provided options
echo -e "\033[0;33mStarting mining...\033[0m"
./cpuminer -a sha256d -o "$pool_url" -u "$btc_address" -p "$mining_pass" -t "$num_threads"
