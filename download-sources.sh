#!/bin/bash
set -xe
cd "$(dirname "$0")"

# Required for flashing and kernel building
wget -c https://developer.nvidia.com/embedded/dlc/r32-3-1_Release_v1.0/t186ref_release_aarch64/Tegra186_Linux_R32.3.1_aarch64.tbz2
tar xvf Tegra186_Linux_R32.3.1_aarch64.tbz2

# Required for flashing
wget -c -O rootfs.tbz2 https://developer.nvidia.com/embedded/dlc/r32-3-1_Release_v1.0/t186ref_release_aarch64/Tegra_Linux_Sample-Root-Filesystem_R32.3.1_aarch64.tbz2

