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
	`davs@thisisaunixmachine:~$ sudo adduser jamecho1`

- Check the primary and extra groups jamecho1 belongs to:
	`davs@thisisaunixmachine:~$ sudo id jamecho1`

- Add the group adm to jamecho1 and retain existing groups:
	`davs@thisisaunixmachine:~$ sudo usermod -a -G adm jamecho1`

- add the user username to groups gx1 and gx2:
	+ `usermod -a -G gx1,gx2 username`

- Verify the new group is added to jamecho1:
	`davs@thisisaunixmachine:~$ sudo id jamecho1`

- Delete the user jamecho1 and all files in jamecho1 home directory:
	`davs@thisisaunixmachine:~$ sudo deluser --remove-home jamecho1`

- `sudo adduser kk1` // creates the group kk1
- `sudo adduser kk1` --ingroup linuxfans // add the new user to the group linuxfans
- check th id of a user: `id --user kk1`


## Network

- show networks:
	`nmcli`
	`nmcli device show ens33`
	`nmtui`

- Networks:
	`nmcli`
	`nmtui`
	`ip`


- display change display resolution
	`xrandr --screen 0 -s 1024x768`
	`fbsetbg -l`

- nmcli device show
	```
		davs@thisisaunixmachine:~$ nmcli device show
		GENERAL.DEVICE:                         ens33
		GENERAL.TYPE:                           ethernet
		GENERAL.HWADDR:                         BA:AC:32:71:43:4C
		GENERAL.MTU:                            1500
		GENERAL.STATE:                          100 (connected)
		GENERAL.CONNECTION:                     Wired connection 1
		GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/ActiveConnection/1
		WIRED-PROPERTIES.CARRIER:               on
		IP4.ADDRESS[1]:                         193.176.83.128/24
		IP4.GATEWAY:                            193.176.83.2
		IP4.ROUTE[1]:                           dst = 0.0.0.0/0, nh = 193.176.83.2, mt = 100
		IP4.ROUTE[2]:                           dst = 193.176.83.0/24, nh = 0.0.0.0, mt = 100
		IP4.ROUTE[3]:                           dst = 169.254.0.0/16, nh = 0.0.0.0, mt = 1000
		IP4.DNS[1]:                             193.176.83.2
		IP4.DOMAIN[1]:                          localdomain
		IP6.ADDRESS[1]:                         fe80::ff6f:2b4c:1012:e67f/64
		IP6.GATEWAY:                            --
		IP6.ROUTE[1]:                           dst = fe80::/64, nh = ::, mt = 100

		GENERAL.DEVICE:                         lo
		GENERAL.TYPE:                           loopback
		GENERAL.HWADDR:                         00:00:00:00:00:00
		GENERAL.MTU:                            65536
		GENERAL.STATE:                          10 (unmanaged)
		GENERAL.CONNECTION:                     --
		GENERAL.CON-PATH:                       --
		IP4.ADDRESS[1]:                         127.0.0.1/8
		IP4.GATEWAY:                            --
		IP6.ADDRESS[1]:                         ::1/128
		IP6.GATEWAY:                            --
		IP6.ROUTE[1]:                           dst = ::1/128, nh = ::, mt = 256

	```
- command `ip route`
	```
	davs@thisisaunixmachine:~$ ip route
	default via 192.168.83.2 dev ens33 proto dhcp metric 100 
	169.254.0.0/16 dev ens33 scope link metric 1000 
	192.168.83.0/24 dev ens33 proto kernel scope link src 192.168.83.128 metric 100 
	```

	- `192.168.83.128` is the ip address
	- `/24` is the netmask
	- DNS server is `192.168.83.2`
	
- command `ip address show`
	```
	davs@thisisaunixmachine:~$ ip address show
	1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
	    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
	    inet 127.0.0.1/8 scope host lo
	       valid_lft forever preferred_lft forever
	    inet6 ::1/128 scope host 
	       valid_lft forever preferred_lft forever
	2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
	    link/ether 00:0c:29:72:43:4c brd ff:ff:ff:ff:ff:ff
	    altname enp2s1
	    inet 192.168.83.128/24 brd 192.168.83.255 scope global dynamic noprefixroute ens33
	       valid_lft 1560sec preferred_lft 1560sec
	    inet6 fe80::ff6f:2b4c:1012:e67f/64 scope link noprefixroute 
	       valid_lft forever preferred_lft forever

	```

- network ip calculations:
	```
	ipcalc 192.168.83.128/24
	```


davs@thisisaunixmachine:~$ host www.linuxfoundation.org


davs@thisisaunixmachine:~$ dig www.linuxfoundation.org

The nameserver can also be manually entered in the interface configuration file or the /etc/resolv.conf file.


- Steps to fix networking issues:
	1. Verify the adapter is active
	2. Verify the local configuration
	3. Verify connections
	4. Verify server functions

- nmcli connection { show | up | down | modify | add | edit | clone | delete | monitor | reload | load | import | export | migrate }

- `nmcli general hostname some.example.com`
- `nmcli general permissions`

- Example, add a connection ETH
	+ `nmcli connection add type ethernet con-name connection-name ifname interface-name ip4 address gw4 address`

- in debian like distros, network config is in:
	+ `/etc/networks/interfaces`



### 1. identify

- List of devices:
	- `davs@thisisaunixmachine:~$ ip link`
	- `davs@thisisaunixmachine:~$ ip link | grep “: en”`
	- `ip link | grep ": et"`

- disconnect
	`davs@thisisaunixmachine:~$ sudo ip link set eno1 down`
- connect
	`davs@thisisaunixmachine:~$ sudo ip link set eno1 up`
- check
	`davs@thisisaunixmachine:~$ ip link | grep “eno1”`

- check the driver or optional driver for the device
	`davs@thisisaunixmachine:~$ sudo ethtool -i enp1s0`

- check the driver or optional driver for the device
	`davs@thisisaunixmachine:~$ sudo lshw -C network`


### Local configuration

- check active connections and related devices:
	- `davs@thisisaunixmachine$ nmcli con sho -a`
	
- check the dhcp of an specific cionnection/server
	`davs@thisisaunixmachine$ nmcli con sho ubuntu8main | grep "^DHCP4"`

- put the connection down:
	- `davs@thisisaunixmachine$ nmcli con down id ubuntu8main`
	
- check again the status
	`davs@thisisaunixmachine$ nmcli con sho ubuntu8main| grep "^DHCP4"`

- put the connection up:
	`davs@thisisaunixmachine$ nmcli con up id ubuntu8main`

- check connection again:
	`davs@thisisaunixmachine$ nmcli con sho ubuntu8main | grep "^DHCP4"|grep expiry`



### using isc dhcp client

- 
	`sudo dhclient -v eno1`

- check the directory `/var/lib/dhclient/dhclient.leases` to see If the DHCP client is being used:
	`$ cat /var/lib/dhclient/dhclient.leases`
	- or the temp var: `PATH_DHCLIENT_DB`
	-
	```
	default-duid "\001\002>n\1357.\326J;\262,\322\343\271\018\341\341";
	lease {
	  interface "enp1";
	  fixed-address 183.156.0.152;
	  option subnet-mask 255.255.255.0;
	  option time-offset -19000;
	  option routers 183.156.0.1;
	  option dhcp-lease-time 22600;
	  option dhcp-message-type 5;
	  option domain-name-servers 183.156.0.1;
	  option dhcp-server-identifier 183.156.0.1;
	  option domain-name "example.com";
	  renew 3 2023/1/03 13:10:33;
	  rebind 4 2023/1/04 13:37:33;
	  expire 4 2023/1/04 13:22:33;
	}
	```
	- the result could be:

	---|---
	ip address | 183.156.0.152
	netmask | option subnet-mask 255.255.255.0
	default route | option routers 183.156.0.1
	name server | option domain-name-servers 183.156.0.1;


- Verify the ip and netmask:
	`$ sudo ip address show`
	`$ sudo ip a`


### Local connections check


- command
	`davs@thisisaunixmachine:~$ ping -c 4 127.0.0.1`

- Check to see if the default router is accessible:

	`davs@thisisaunixmachine:~$ ping -c 4 192.168.0.1`

- Check to see if the default router is passing packets; connect to some system that is not local:

	`davs@thisisaunixmachine:~$ ping -c 4 8.8.8.8`

- Check the nameserver is working; connect via name, not the IP address:

	`davs@thisisaunixmachine:~$ ping -c 4 www.google.com`

- The use of ping may be misleading, as it uses the ICMP protocol, while normal web traffic uses TCP. The last test, connecting to a web browser with your favorite browser, will confirm that TCP is working:

	`davs@thisisaunixmachine:~$ elinks -dump www.google.com`

- know the ip:
	+ `ip address`

### Verify

#### daemons check

- check daemons in general
	`davs@thisisaunixmachine>~$ sudo systemctl`
	`davs@thisisaunixmachine>~$ sudo systemctl status netdata.service`


#### Verify the correct port is open

- See actual sockets of the application: 
	`davs@thisisaunixmachine>~$ sudo ss -tlap`
	+ `-t` tcp sockets
	+ `-l` listening sockets (waiting for incoming conn)
	+ `-a` all sockets  
	+ `-p` PID and process name 
- same but with `-n`
	`davs@thisisaunixmachine>~$ sudo ss -tlapn`
	+ `-n` port numbers
- make a get request to validate
	`davs@thisisaunixmachine>~$ curl http://127.0.0.1:631 | head`
- get request to validate connection
	`davs@thisisaunixmachine>~$ curl http://127.0.0.1:19999 | head`


#### Firewall check

- `davs@thisisaunixmachine>~$ sudo iptables -vnL`

- iptables
	+ iptables is a user-space utility program that allows a system administrator to configure the IP packet filter rules of the Linux kernel firewall
- ufw, uncomplicated firewall (ubuntu) [https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-20-04]
- netfilter, firewall inside the kernel


## Sudoers

- command
	+ `davs@thisisaunixmachine>~$ sudo cat /etc/sudoers`
	+ `davs@thisisaunixmachine>~$ sudo cat /etc/sudoers.d/davs`

- passwd
	+ `davs@thisisaunixmachine>~$ head -n 3 /etc/passwd`
	
- shadow
	+ `sudo grep davs /etc/shadow`
	+ `sudo cat /etc/shadow | grep user`
	
- stats about password of a user:
	+ `chage -l user`
	

- Files permissions, discretionary Access Control (DAC) and Access Control Lists (ACL). 
- ACL: 
	+ 421 > rwx >>
		* 7: 4+2+1 = 7 (rwx)
		* 6: 4+2+0 = 6 (rw-)
		* 5: 4+0+1 = 5 (r-x)
		* 4: 4+0+0 = 4 (r--)
		
	
	+ types (the first position):
		+ "-" regular file type
		+ "d" directory entry type
		+ "l" soft link type
		+ "c" character device type
		+ "b" block device type
		+ "p" named pipe type
		+ "s" socket type

	+ permissions apply in order, for example: 
		* `chmod 722 a.txt` // add rwx -w- -w-
		* `chmod o+x a.txt` // add execution capabilities to the others

	- find inode information of a file
		+ `stat a.txt`
		+ `stat -c '%U' a.txt` // find the username of the owner
		+ `stat -c '%u' a.txt` // find the user id of the owner
		+ `stat -c '%G' a.txt` // find the groupname of the owner
		+ `stat -c '%g' a.txt` // find the group id of the owner

- ACL Permissions
	+ `getfacl`
	+ `setfacl`

	- encryption
		+ `cryptsetup`

	- Example setting of ACL (Access Control list)
		`setfacl -d -m accounting:rwx /finance`

	- Setting jamecho access to the /finance folder:
		`setfacl -m jamecho:r-x /finance`

			```
				Getfacl c.txt
				Touch c.txt
				Getfacl c.txt
			```
	Example getting:
		+ `getfacl /finance`
	
- Sticky bit (prevent deletion of a folder, after `ll` it shows a t at the end):
	+ `chmod o+t /opt/dump/`
	+ `chmod +t /opt/dump/`
	



### Firewalls

- command
	+ `davs@thisisaunixmachine>~$ sudo apt install firewalld firewall-config`
	+ `davs@thisisaunixmachine>~$ grep iptables -B3 /etc/firewalld firewalld.conf`
- documentation:
	+ [https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands]
	+ [https://help.ubuntu.com/community/UFW]



### Intrusion detection
* app
	- `aide`
	- Install:
		+ `sudo apt install aide`
		+ init: `aideinit`
	- config
		+ `sudo --check /etc/aide/aide.conf`
		

## Daemons


- `pstree`

- Unit are daemons
	`Systemctl list-units`

- List all (got to memory by systemd)
	`Systemctl list-units  --all | grep <some>`

- Will show units are not only part of the memory, so, everything:
	`Systemctl list-unit-files --all | grep nginx`

- Check services status
	`systemctl is-active application.service`
	`systemctl is-enabled application.service`
	`systemctl is-failed application.service`

- list dependencies:
	+ `systemctl list-dependencies sshd.service`
	


## Misc

- show 2 files side by side
	`pr -m -t one.txt two.txt`

- start the service:
	+ `systemctl start nginx`
	+ if fails or is not available, check journalctl

- check journalctl
	- `sudo journalctl -xe`
	- if no info, then find real name:
		+ `sudo systemctl list-units | grep journal`
		+ generally named: `systemd-journald`
		+ then start it `sudo systemctl start systemd-journald`

- `systemctl show sshd.service`
- find, locate, whereis:
	+ find: check each file, so it's slow
	+ locate: faste, checks the db
	+ whereis: show location of specific file

### Example with apache

- install
	+ `dnf install apache2`
- find the daemon
	+ `systemctl list-unit-files --all | grep http`
- start the service:
	+ `systemctl start httpd`
	+ `sudo systemctl enable httpd --now`
- Verify
	+  `systemctl status httpd`
-  get the ip:
	+  `ip addr`
	+  `ip address`
	+  `ifconfig`
	
- configure the firewall:
	+ for http:
		* `sudo firewall-cmd --permanent --add-port=80/tcp`
	+ for https:
		* `sudo firewall-cmd --permanent --add-port=443/tcp`
	+ Reload firewall
	+ `sudo firewall-cmd --reload`

- create a html page:
	+ in `/var/www/html` create an html file:
		* `<html><h1>test ok</h1> </html>`



### ssh (Fedora)

- check if installed:
	+ `rpm -qa | grep openssh-server`
- install ssh (Fedora)
	+ `dnf install ssh`
- check daemon
	+ `systemctl status sshd`
- start if required
	+ `sudo systemctl start sshd`
- check the port:
	+ `sudo lsof -i -P -n | grep LISTEN`
	+ `ss -lt`
	+ `ss -ltp`
- get the ip:
	+ `ip a`
	+ `ip addr`
	+ `ip address`
- to connect:
	+ `ssh -p 222 jamecho@<ip>`
	+ type password


### Virtualization

- libvirt is an open-source API, daemon and management tool for managing platform virtualization. It can be used to manage KVM, Xen, VMware ESXi, QEMU and others. these APIs are widely used in the orchestration of hypervisors in the development of a cloud-based solution

- The virtual shell, or virsh, is a flexible command-line utility for managing virtual machines (VMs) controlled by libvirt.

- VMM, Virtual Machine Manager, also known as virt-manager, is a graphical tool for creating and managing guest virtual machines.


### Git


- Initialize git (locally) the correct way:
 
- `git init .`
- `git commit --allow-empty -m "Initial commit"`
 
- the default name is in field "init.defaultbranch=main" in:
	`git config -l`
 
- Check the config list:
	`git config --list`
 
 
- Create a new branch
 
	`git branch branch1`
 
- List all branches and check where are now
	`git branch -l`
	`git branch --list`
 
- Change branch
	`git checkout main`
	`git checkout branch1`
 
- Create and change branch in 1 command
	`git checkout -b my-new-branch`
 
	`$ git config --global user.name "sdsanchezm" (sdsanchezm is my name)`
	`$ git config --global user.email "mySuperEmailExample@example.com" `
 
 
- Change owner and group of a file: 
	```
	sudo chown 1001:1002 example.txt
	sudo chown username example.txt
	sudo chgrp groupname example.txt
	sudo chown aspen:seamus /var/opt/test
	```
 
- The ".git" folder in a repository represents the local repository itself, not the staging area.

















# References

- [https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units]
- [https://networkmanager.dev/docs/api/latest/nmcli.html]
- [https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-configuring_ip_networking_with_nmcli]
- - [https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-apache-http-server/]
- *[Good one]* [https://www.linuxcapable.com/how-to-install-apache-httpd-on-fedora-linux/]
- iptables [https://www.redhat.com/sysadmin/iptables]
- Server Less [https://www.cloudflare.com/learning/serverless/what-is-serverless/]