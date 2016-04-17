


## Make a clone of an SD card, but just the boot sector

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

Change file system type

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

Copy just the boot partion:

sudo dd if=/dev/sda1 | pv | sudo dd of=/dev/sdb1


sudo dd if=/dev/rdisk2s1 bs=1m | pv | sudo dd of=boot.img
