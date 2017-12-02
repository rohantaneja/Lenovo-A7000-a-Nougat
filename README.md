-------------------------------------------------------------------------------------

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | 1.5GHz 64-bit Octa-Core MT6752
GPU     | Mali-T760MP2
Memory  | 2GB RAM
Shipped Android Version | 5.0
Storage | 8GB
Display | 5.5" IPS 1280 x 720 px
Camera  | 8MPx, LED Flash

-------------------------------------------------------------------------------------

* Compilation
        
        $ export CROSS_COMPILE=aarch64-linux-android-

        $ export PATH=~/toolchains/aarch64-linux-android-x.x/bin:$PATH

        $ export ARCH=arm64

        $ make daredevil_defconfig ARCH=arm64 CROSS_COMPILE=aarch64-linux-android-

        $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-android-
        
-------------------------------------------------------------------------------------

### Credits
  - rohantaneja
  - Xakep16
  - adeveloper (Sandeep Sethi)
  - pinnamanivenkat
  - AnonymousMediatekTeam
  - all those who brought up N to MTK

-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------

![DevilKernel-Nougat](https://gitlab.com/aryankedare/DevilKernel-Nougat/blob/master/devicebanner.png "BANNER")
