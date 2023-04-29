#! /bin/bash
# ==================================================
#  Coded by Woong
# ==================================================
if [ `whoami` == "root" ]; then
	# ----------------------------------------------
	# [Update & Upgrade]
	# ----------------------------------------------
	sudo apt-get -y update
	sudo apt-get -y upgrade
	
	sudo apt-get -y install build-essential
	sudo apt-get -y install samba openssh-server
	sudo apt-get -y install vim-gtk3
	sudo apt-get -y install x11-apps dbus-x11
	sudo apt-get -y install gnome-terminal
	sudo apt-get -y install tcl-dev tk-dev python3-dev python3-pip python3-tk python3-pexpect python3-git python3-jinja2
	sudo apt-get -y install cmake clang ctags
	sudo apt-get -y install libxcb-xinerama0

	# ----------------------------------------------
	# [Python]
	# ----------------------------------------------
	sudo pip3 install --upgrade pip launchpadlib setuptools
	sudo pip3 install numpy pandas scipy matplotlib pillow pypi progress idx2numpy xlrd
	sudo pip3 install jupyter jupyterlab
	sudo pip3 install mkdocs

	# for jupyter qtconsole
	sudo pip3 install PySide2
	
	# ----------------------------------------------
	# [Bash Environment Setup]
	# ----------------------------------------------
	cp .bash_aliases	~
	cp .vimrc			~
	mkdir -p			~/.vim
	mkdir -p			~/project
	cp -rf bundle		~/.vim/
	cp -rf Sudo			/usr/share/fonts/truetype/
	
	source ~/.bashrc
	
	# ----------------------------------------------
	# [SSH]
	# ----------------------------------------------
	printf "\n"							>> /etc/ssh/ssh_config
	printf "\tForwardX11 yes\n"			>> /etc/ssh/ssh_config
	printf "\tForwardX11Trusted yes\n"	>> /etc/ssh/ssh_config
	
	printf "\n"							>> /etc/ssh/sshd_config
	printf "\tX11Forwarding yes\n"		>> /etc/ssh/sshd_config
	printf "\tPermitRootLogin yes\n"	>> /etc/ssh/sshd_config
	
	# ----------------------------------------------
	# [Samba]
	# ----------------------------------------------
	mkdir -p /vlsisys-samba
	chmod 777 /vlsisys-samba
	sudo ufw allow samba
   
	printf "\n"							>> /etc/samba/smb.conf
	printf "[vlsisys-samba]\n"			>> /etc/samba/smb.conf
	printf "\tcomment = vlsisys-samba\n">> /etc/samba/smb.conf
	printf "\tbrowseable = yes\n"		>> /etc/samba/smb.conf
	printf "\tpath = /vlsisys-samba\n"	>> /etc/samba/smb.conf
	printf "\tguest ok = yes\n"			>> /etc/samba/smb.conf
	printf "\tread only = no\n"			>> /etc/samba/smb.conf
	
	# ----------------------------------------------
	# [Ubuntu Driver Install]
	# ----------------------------------------------
	sudo ubuntu-drivers autoinstall
	sudo reboot

else
	echo "======================================================================\n"
	echo " This script is permitted for root account!!!\n"
	echo "======================================================================\n"
fi
