#! /bin/bash
# ==================================================
#  Coded by Woong
# ==================================================

if [ `whoami` == "root" ]; then
	# ----------------------------------------------
	# [cuda]
	# ----------------------------------------------
	sudo dpkg --add-architecture i386
	sudo apt-get update
	sudo apt-get -y install zlib1g:i386
	sudo apt-get -y install net-tools xterm autoconf libtool texinfo gcc-multilib

else
	echo "======================================================================\n"
	echo " This script is permitted for root!!!\n"
	echo "======================================================================\n"
fi
