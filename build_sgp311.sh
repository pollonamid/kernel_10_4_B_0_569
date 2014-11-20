
export TCHAIN=../../../prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin/arm-eabi-

make ARCH=arm clean
make ARCH=arm CROSS_COMPILE=$TCHAIN custom_fusion3_pollux_windy_defconfig
make ARCH=arm CROSS_COMPILE=$TCHAIN -j 8

# add new kernel
cp arch/arm/boot/zImage ../../../device/sony/sgp321/kernel.windy

# drop kernel modules
cp ./drivers/staging/prima/wlan.ko  ../../../vendor/sony/yuga_blobs/system/lib/modules/wlan.ko
cp ./drivers/media/radio/radio-iris-transport.ko ../../../vendor/sony/yuga_blobs/system/lib/modules/radio-iris-transport.ko

# refresh kernel headers
( cd ../../../device/sony/lagan/ && sh update_kernel_headers.sh )
