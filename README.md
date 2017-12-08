Scripts to compile custom kernels and generate custom images for the Jetson TX2.

* `create-image.sh`: Downloads sources and a rootfs, applies customizations to the rootfs and creates a `system.img`. To run customizations, `qemu-aarch64-static` is required.

References:
* [This page](https://github.com/Technica-Corporation/Tegra-Docker) has a good overview of kernel building for the TX2 and containerized GPU access.
