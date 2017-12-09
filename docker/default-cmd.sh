#!/bin/bash
set -xe
sources=/jetson-tx2-linux/Linux_for_Tegra
cd $sources
./source_sync.sh -t tegra-l4t-r28.1
wget -O gcc-aarch64.tgz https://developer.nvidia.com/embedded/dlc/l4t-gcc-toolchain-64-bit-28-1
mkdir toolchain-root
tar xf gcc-aarch64.tgz -C toolchain-root

export CROSS_COMPILE=$sources/toolchain-root/install/bin/aarch64-unknown-linux-gnu-
mkdir -p $sources/kernel-build
export O=$sources/kernel-build
export ARCH=arm64

cd $sources/sources/kernel/kernel-4.4
make mrproper
make O=$O tegra18_defconfig
scripts/kconfig/merge_config.sh -m -O $O $O/.config /jetson-tx2-linux/customization/config.fragment
make O=$O olddefconfig
make O=$O zImage
make O=$O dtbs
make O=$O modules
make O=$O modules_install INSTALL_MOD_PATH=$O/modules

echo "Remember to copy the new modules alongside the kernel! To create a tar of the modules, run:"
echo "cd \"$O/modules\" && tar --owner root --group root -cjf kernel_supplements.tbz2 \*"
