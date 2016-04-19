

Compile u-boot in OS X virtual machine

https://blog.night-shade.org.uk/2015/05/booting-a-raspberry-pi2-with-u-boot-and-hyp-enabled/

- VirtualBox: https://www.virtualbox.org/wiki/Downloads
- Debian9: http://cdimage.debian.org/cdimage/weekly-builds/amd64/iso-cd/

Run:
		sudo apt-get install gcc-arm-linux-gnueabihf
		export ARCH=arm
		export CROSS_COMPILE=arm-linux-gnueabihf-
Clone u-boot
		git clone git://git.denx.de/u-boot.git
		cd u-boot
		make rpi_2_defconfig
		make all

Copy/paste `u-boot.bin` on the `/boot` partition of the SD card, and change `config.txt` to say: `kernel=u-boot.bin`


TFTP server: 
- http://processors.wiki.ti.com/index.php/Booting_Linux_kernel_using_U-Boot


