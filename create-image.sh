#!/bin/bash
set -xe
sources="$(dirname "$0")"/Linux_for_Tegra
if [ ! -d "$sources" ] ; then
    echo 'Run download-sources.sh first' 2>&1
    exit 1
fi

sudo rm -rf "$sources/rootfs"
mkdir -p "$sources/rootfs"
for input in "$@" ; do
    if [ -x "$input" ] ; then
        # Copy scripts and run containerized in the image
        cp "$input" "$sources/rootfs"
        sudo systemd-nspawn --bind /usr/bin/qemu-aarch64-static -D "$sources/rootfs" "/$(basename "$input")"
    else
        # "sudo tar" is required to create files owned by root (we can use fakeroot in the tar
        # and flash.sh commands, but working around the systemd-nspawn container is complicated).
        sudo tar xf "$input" -C "$sources/rootfs"
    fi
done

# Workaround missing loopback devices in newer system, where they are created
# dynamically. "losetup --find" will enforce their existence before running
# "./flash.sh".
# https://devtalk.nvidia.com/default/topic/760912/flashing-r19-3-mapping-system-img-to-loop-device-failed-/
sudo losetup --find
cd "$sources"
sudo ./apply_binaries.sh
sudo ./flash.sh --no-flash jetson-tx2 mmcblk0p1
