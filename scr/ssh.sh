#! /bin/bash

# ----------------------------------------------
# [SSH]
# ----------------------------------------------
sudo echo "\n"				>> /etc/ssh/ssh_config
sudo echo "\tForwardX11 yes\n"		>> /etc/ssh/ssh_config
sudo echo "\tForwardX11Trusted yes\n"	>> /etc/ssh/ssh_config
sudo echo
sudo echo "\n"							>> /etc/ssh/sshd_config
sudo echo "\tX11Forwarding yes\n"		>> /etc/ssh/sshd_config
sudo echo "\tPermitRootLogin yes\n"	>> /etc/ssh/sshd_config
