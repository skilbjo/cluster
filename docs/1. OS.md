# llcomputing

## Arch Linux install guide

Installation guide: https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-3 

## Move the /root partition to 

Once the operating system is installed, move the /root partition to a more stable memory medium (SSD).

Guide: https://www.raspberrypi.org/forums/viewtopic.php?f=29&t=44177

## Arch Linux clode guide

Due to the raspberry pi bootloader, 

- stage 1: GPU executes first stage bootloader stored in ROM on the SoC, which loads bootcode.bin into L2 cache and executes it
- stage 2: bootcode.bin enables SDRAM, which reads the third stage bootloader (loader.bin) from the SD card into RAM, and executes it
- stage 3: loader.bin reads the GPU firmware, start.elf, which reads config.txt which then loads => cmdline.txt and kernel.img

Stage 1 exists in ROM, but stage 2 and stage 3 files must live in the /dev/mmcblk0p7 partition.

If the SD card holding the /dev/mmcblk0p7 parition ever becomes corrupted, we just need to replace it with the valid boot files.

Guide to formatting a boot partition on a debian system.

- insert two USB SD card readers into the USB ports
- format the clone card to mimic partition scheme:

		sudo fdisk /dev/sdb

		Command (m for help): d
		Selected partition 1
		Partition 1 has been deleted.

		Command (m for help): p
		Disk sdb: 1.9 GiB, 1977614336 bytes, 3862528 sectors
		Units: sectors of 1 * 512 = 512 bytes
		Sector size (logical/physical): 512 bytes / 512 bytes
		I/O size (minimum/optimal): 512 bytes / 512 bytes
		Disklabel type: dos
		Disk identifier: 0x00000000

		Command (m for help): n
		Partition type
		   p   primary (0 primary, 0 extended, 4 free)
		   e   extended (container for logical partitions)
		Select (default p): p
		Partition number (1-4, default 1): 
		First sector (2048-3862527, default 2048): 
		Last sector, +sectors or +size{K,M,G,T,P} (2048-3862527, default 3862527): +100M

		Created a new partition 1 of type 'Linux' and of size 100 MiB.

		Command (m for help): n
		Partition type
		   p   primary (1 primary, 0 extended, 3 free)
		   e   extended (container for logical partitions)
		Select (default p): 

		Using default response p.
		Partition number (2-4, default 2): 
		First sector (206848-3862527, default 206848): 
		Last sector, +sectors or +size{K,M,G,T,P} (206848-3862527, default 3862527): 

		Created a new partition 2 of type 'Linux' and of size 1.8 GiB.

		Command (m for help): w
		The partition table has been altered.
		Calling ioctl() to re-read partition table.
		Syncing disks.


- change the file system type of the first partiition to W95 FAT32

		Command (m for help): t
		Partition number (1,2, default 2): 1
		Hex code (type L to list all codes): c

		If you have created or modified any DOS 6.x partitions, please see the fdisk documentation for additional information.
		Changed type of partition 'Linux' to 'W95 FAT32 (LBA)'.

		Command (m for help): p
		Disk /dev/sdb: 1.9 GiB, 1977614336 bytes, 3862528 sectors
		Units: sectors of 1 * 512 = 512 bytes
		Sector size (logical/physical): 512 bytes / 512 bytes
		I/O size (minimum/optimal): 512 bytes / 512 bytes
		Disklabel type: dos
		Disk identifier: 0x00000000

		Device     Boot  Start     End Sectors  Size Id Type
		/dev/sdb1  *      2048  206847  204800  100M  c W95 FAT32 (LBA)
		/dev/sdb2       206848 3862527 3655680  1.8G 83 Linux

		Command (m for help): w
		The partition table has been altered.
		Calling ioctl() to re-read partition table.
		Syncing disks.

- use dd (still in debian) to clone the boot partion from the parent to the clone:

		sudo dd if=/dev/sda1 | pv | sudo dd of=/dev/sdb1

- clone a backup image onto an OS X laptop

		sudo dd if=/dev/rdisk2s1 bs=1m | pv | sudo dd of=boot.img
