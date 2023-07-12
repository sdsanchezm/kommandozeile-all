# General Notes

- `# tar -cvf /opt/backup.tar /home`
- `tar -cvf <target_file> <source-files or directory>`

- `rsync -rzvh --exclude *\.cache/ /home/. \ /opt/backups/`
- // view devices
- `Lsblk -f`

- View devices
	`user@machine:~$ sudo lsblk -f | grep -v loop`

- Mount the usb/device and view after:
	`user@machine:~$ sudo lsblk -f | grep -v loop`

- Umount:
	`user@machine:~$ sudo umount /media/user/Debian-XY-Live-25-1-3`

- show the tree of a folder
	`tree -L 1 -d`
- view the inode info
	`stat file`

- list:
	`ls -lrt` >> -l list ; r, reverse; t: time accessed


	```
	davs@thisisaunixmachine:~$ id uid=1000(davs) gid=1000(davs) groups=1000(davs),4(adm),24(cdrom),27(sudo),30 dip),46(plugdev),120(lpadmin),132(lxd),133(sambashare)
	```

	```
	davs@thisisaunixmachine:~$ sudo id
	uid=0(root) gid=0(root) groups=0(root)
	```

	```
	davs@thisisaunixmachine:~$ sudo blkid
	/dev/sda5: UUID="AAA252bf-2bc3-4EEE-b26d-c1c7279a7EEE" TYPE="ext4" PARTUUID="d64e916a-05"
	/dev/loop0: TYPE="squashfs"
	/dev/loop1: TYPE="squashfs"
	/dev/loop2: TYPE="squashfs"
	/dev/loop3: TYPE="squashfs"
	/dev/loop4: TYPE="squashfs"
	/dev/loop5: TYPE="squashfs"
	/dev/loop6: TYPE="squashfs"
	/dev/loop7: TYPE="squashfs"
	/dev/sda1: UUID="2776-669C" TYPE="vfat" PARTUUID="d33e916a-01"
	/dev/loop8: TYPE="squashfs"
	/dev/loop9: TYPE="squashfs"
	/dev/loop10: TYPE="squashfs"
	/dev/loop11: TYPE="squashfs"
	```


	```
	davs@thisisaunixmachine:~$ sudo blkid | grep -v loop`
	/dev/sda5: UUID="16cc2bf-xyc3-1222-b26x-x1c7279a7ta2" TYPE="ext4" PARTUUID="d64e916a-05"
	/dev/sda1: UUID="xED6-339B" TYPE="vfat" PARTUUID="d14e916b-02"
	```

- check how much memory is free
	`free -m`

- Check which port is opened with the ss command:
	`ss -t -a -n`

- List the partition table on storage /dev/sdb:
	`sudo fdisk -l /dev/sdb`

- Check which port is opened with the ss command:
	`davs@thisisaunixmachine:~$ ss -t -a -n`

- Install the netdata package on  Linux:
	`davs@thisisaunixmachine:~$ sudo apt install netdata`

- Use the ss command to determine which TCP ports are opened and which program is listening on the port:
	`davs@thisisaunixmachine:~$ sudo ss -t -a -n -p`

- The next command opens a Firefox browser window and communicates with the netdata background service:
	`davs@thisisaunixmachine:~$ firefox http://127.0.0.1:19999`

- To check the status of the netdata service, run:
	`davs@thisisaunixmachine:~$ sudo systemctl status netdata`

- To stop the netdata service:
	`davs@thisisaunixmachine:~$ sudo systemctl stop netdata`

- To disable netdata from starting at boot time:
	`davs@thisisaunixmachine:~$ sudo systemctl disable netdata`

- To re-enable the netdata service starting at boot time:
	`davs@thisisaunixmachine:~$ sudo systemctl enable netdata`

- Start the netdata service:
	`davs@thisisaunixmachine:~$ sudo systemctl start netdata`

- To get the status of all installed services:
	`davs@thisisaunixmachine:~$ sudo systemctl`

- Add a new user to the system:
	`davs@thisisaunixmachine:~$ sudo adduser student1`

- Check the primary and extra groups student1 belongs to:
	`davs@thisisaunixmachine:~$ sudo id student1`

- Add the group adm to student1 and retain existing groups:
	`davs@thisisaunixmachine:~$ sudo usermod -a -G adm student1`

- Verify the new group is added to student1:
	`davs@thisisaunixmachine:~$ sudo id student1`

- Delete the user student1 and all files in student1’s home directory:
	`davs@thisisaunixmachine:~$ sudo deluser --remove-home student1`

- show networks:
	`nmcli`
	`nmcli device show ens33`
	`nmtui`

- Networks:
	`nmcli`
	`nmtui`
	`ip`














