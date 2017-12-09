#!/bin/bash
set -xe
cd "$(dirname "$0")"

# Required for flashing and kernel building
wget -c http://developer2.download.nvidia.com/embedded/L4T/r28_Release_v2.0/BSP/Tegra186_Linux_R28.2.0_aarch64.tbz2
tar xf Tegra186_Linux_R28.2.0_aarch64.tbz2

# Required for flashing
wget -c -O rootfs.tbz2 https://developer.nvidia.com/embedded/dlc/l4t-sample-root-filesystem-28-2
