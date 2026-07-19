#!/bin/bash
set -ex

# https://stackoverflow.com/a/78205773/7363348

if [ "`id -u`" -ne 0 ]; then
 echo "Switching from `id -un` to root"
 exec sudo "$0"
 exit 99
fi

# # Create a temp folder on a disk that has a lot of space:
# mkdir -p /bigtempfolder
#
# # Change TMPDIR env to the big folder you just created:
# export TMPDIR=/bigtempfolder
#
# # Set generous access to the temp folder:
#
# sudo chmod 777 /bigtempfolder

# Create a Swap of 4 GB:
sudo dd if=/dev/zero of=/bigswap bs=1M count=4096

# Format the file for Swap usage
sudo mkswap /bigswap

# Activate Swap file
sudo swapon /bigswap

# Make the Swap permanent
echo '/bigswap none swap sw 0 0' | sudo tee -a /etc/fstab

# Verify that the swap is now activated
sudo swapon --show
