#! /bin/bash
# ==================================================
#  Coded by Woong
# ==================================================

if [ `whoami` == "root" ]; then
	# ----------------------------------------------
	# [Required Packages]
	# ----------------------------------------------
	sudo dpkg --add-architecture i386
	sudo apt-get -y update
	sudo apt-get -y install iproute2 gcc g++ net-tools libncurses5-dev zlib1g:i386 libssl-dev flex bison
	sudo apt-get -y install libselinux1 xterm autoconf libtool texinfo zlib1g-dev gcc-multilib screen pax gawk
	sudo apt-get -y install python3 python3-pexpect python3-pip python3-git python3-jinja2 python3-dev python3-tk
	sudo apt-get -y install xz-utils debianutils iputils-ping libegl1-mesa libsdl1.2-dev pylint3 cpio

	# ----------------------------------------------
	# [TFTP Setting]
	# ----------------------------------------------
	sudo apt-get -y install tftp tftpd

	sudo cp ./tftp /etc/xinetd.d/
	sudo mkdir -p /tftpboot
	sudo chmod 777 /tftpboot
	sudo /etc/init.d/xinetd restart

	# ----------------------------------------------
	# [Shell: Dash -> Bash]
	# ----------------------------------------------
	sudo dpkg-reconfigure dash # Please Select No

	echo "======================================================================\n"
	echo " Next Step is as follows\n"
	echo "======================================================================\n"
	echo "	1.mkdir -p /opt/petalinux-v20xx.x \n"
	echo "	2.download petalinux-v20xx.x.run \n"
	echo "	3.$>./petalinux-v20xx.x.run --dir /opt/petalinux-v20xx.x\n"

else
	echo "======================================================================\n"
	echo " This script is permitted for root!!!\n"
	echo "======================================================================\n"
fi
