

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


u-boot>

setenv ftd file bcm2709-rpi-3-b.dtb
mmc dev 0

fatload mmc 0:1 ${kernel_addr_r} kernel7.img
fatload mmc 0:1 ${fdt_addr_r} bcm2710-rpi-3-b-disable-bt.dtb
setenv bootargs earlyprintk dwc_otg.lpm_enable=0 console=ttyAMA0,115200 console=tty1 root=/dev/sda1 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait
bootz ${kernel_addr_r} - ${fdt_addr_r}


