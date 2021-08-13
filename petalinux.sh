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
	sudo apt-get -y install zlib1g:i386 net-tools xterm autoconf libtool texinfo gcc-multilib gawk
	sudo apt-get -y install libncurses5-dev libncursesw5-dev

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
