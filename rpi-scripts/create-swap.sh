#!/bin/bash
set -ex

# https://stackoverflow.com/a/78205773/7363348

if [ "`id -u`" -ne 0 ]; then
 echo "Switching from `id -un` to root"
 exec sudo "$0"
 exit 99
fi

# Create a temp folder on a disk that has a lot of space:
mkdir -p /bigtempfolder

# Change TMPDIR env to the big folder you just created:
export TMPDIR=/bigtempfolder

# Set generous access to the temp folder:

sudo chmod 777 /bigtempfolder

# Create a Swap of 8 GB:
sudo dd if=/dev/zero of=/swapfile1 bs=4M count=4096

# Format the file for Swap usage
sudo mkswap /swapfile1

# Activate Swap file
sudo swapon /swapfile1

# Make the Swap permanent
echo '/swapfile1 none swap sw 0 0' | sudo tee -a /etc/fstab

# Verify that the swap is now activated
sudo swapon --show
