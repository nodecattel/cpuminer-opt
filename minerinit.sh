#!/bin/bash

# Define the cpuminer-opt directory
CPUMINER_DIR="$HOME/cpuminer-opt"

# Check if the cpuminer-opt directory exists
if [ ! -d "$CPUMINER_DIR" ]; then
  echo "Directory $CPUMINER_DIR does not exist. Please clone the repository to $HOME/cpuminer-opt and run the script again."
  exit 1
fi

cd "$CPUMINER_DIR" || { echo "Failed to navigate to $CPUMINER_DIR"; exit 1; }

# Update and install dependencies
echo "Updating package lists and installing dependencies..."
sudo apt-get update
sudo apt-get install -y build-essential automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev git

# Run autogen.sh to generate the configure script
echo "Running autogen.sh..."
./autogen.sh || { echo "autogen.sh failed"; exit 1; }

# Configure the build with optimizations
echo "Configuring the build..."
CFLAGS="-O3 -march=native -Wall" ./configure --with-curl || { echo "Configure failed"; exit 1; }

# Compile the code
echo "Compiling cpuminer-opt..."
make -j$(nproc) || { echo "Compilation failed"; exit 1; }

echo "Compilation completed successfully. You can now run cpuminer-opt by executing ./cpuminer in the $CPUMINER_DIR directory."

exit 0
