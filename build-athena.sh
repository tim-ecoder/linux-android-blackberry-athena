#!/bin/bash

export CCACHE_EXEC=$(which ccache)
export PATH="/usr/lib/ccache:$PATH"
export USE_CCACHE=1
export CCACHE_DIR=/data/ccache
ccache -M 100G
ccache -o compression=true

export OUT_DIR=/data/out-kernel-marsh
#rm -rf $OUT_DIR
#mkdir $OUT_DIR
cp -r ./arch/arm64/boot/dts $OUT_DIR/arch/arm64/boot/
#cp ./arch/arm64/configs/athena-perf_defconfig $OUT_DIR/.config
cp ./arch/arm64/configs/athena-droidian_defconfig $OUT_DIR/.config


export ARCH=arm64
export CROSS_COMPILE=/data3/LOS22/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
make O=$OUT_DIR CROSS_COMPILE=$CROSS_COMPILE ARCH=$ARCH -j16 Image.gz-dtb
