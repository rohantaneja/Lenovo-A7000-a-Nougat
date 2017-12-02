 #
 # Copyright © 2017, Rohan Taneja
 #
 # This software is licensed under the terms of the GNU General Public
 # License version 2, as published by the Free Software Foundation, and
 # may be copied, distributed, and modified under those terms.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 
#!/bin/bash

# tested tc: /home/toolchains/aarch64-linux-android-6.0/bin
# tested tc: /home/toolchains/aarch64-linux-android-5.3/bin
# tested tc (best alternative): /home/toolchains/aarch64-linux-android-4.9/bin

KERNEL_DIR=$PWD
IMAGE=$KERNEL_DIR/arch/arm64/boot/Image.gz-dtb
BUILD_START=$(date +"%s")
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
nocol='\033[0m'         # Default

# change as per you want
export ARCH=arm64
export CONFIG_NO_ERROR_ON_MISMATCH=y
export CROSS_COMPILE=aarch64-linux-android-
export PATH=/home/rohantaneja/aarch64-linux-android-4.9/bin:$PATH
#export CONFIG_DEBUG_SECTION_MISMATCH=y
export KBUILD_BUILD_USER="rohantaneja"
export KBUILD_BUILD_HOST="daredevil"

compile_kernel ()
{

echo -e "$Cyan***********************************************"
make clean && make mrproper
make daredevil_defconfig
make -j4
echo -e "=====================================================================$nocol"
if ! [ -a $IMAGE ];
then
echo -e "$red Build Failed. Please fix the errors! $nocol"
exit 1
fi
}

case $1 in
clean)
make ARCH=arm -j4 clean
rm -rf include/linux/autoconf.h
;;
*)
compile_kernel
;;
esac
BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))
echo -e "$yellow Build completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds.$nocol"
