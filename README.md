Scripts to compile custom kernels and generate custom images for the Jetson TX2.

* `download-sources.sh`: Downloads NVIDIA scripts for building images and flashing and a rootfs.
* `create-image.sh`: Builds a rootfs from the downloaded files and specified customizations, then creates a `system.img`. To run customizations, `qemu-aarch64-static` with `binfmt_misc` configured is required. `./create-image.sh rootfs.tbz2 customization/image-customization.sh` will create an image from NVIDIA's rootfs with customizations from the script.
* `compile-kernel.sh`: Compiles a kernel in a docker container. After applying options in `customization/config.fragment`, the kernel will be built in NVIDIA's recommended environment (Ubuntu 14.04 with NVIDIA's provided GCC cross compiler).

References:
* [This page](https://github.com/Technica-Corporation/Tegra-Docker) has a good overview of kernel building for the TX2 and containerized GPU access.
