#!/bin/bash
set -xe
cd "$(dirname "$0")"
if ! cd Linux_for_Tegra ; then
    echo 'Downloading sources...'
    ./download-sources.sh
    cd Linux_for_Tegra
fi
# "sudo tar" is required to create files owned by root (we can use fakeroot in the tar
# and flash.sh commands, but working around the systemd-nspawn container is complicated).
sudo rm -rf rootfs
mkdir rootfs
sudo tar xf ../rootfs.tbz2 -C rootfs

cp ../customization/image-customization.sh rootfs
sudo systemd-nspawn --bind /usr/bin/qemu-aarch64-static -D rootfs /image-customization.sh
# Workaround missing loopback devices in newer system, where they are created
# dynamically. "losetup --find" will enforce their existence before running
# "./flash.sh".
# https://devtalk.nvidia.com/default/topic/760912/flashing-r19-3-mapping-system-img-to-loop-device-failed-/
sudo losetup --find
sudo ./apply_binaries.sh
sudo ./flash.sh --no-flash jetson-tx2 mmcblk0p1
