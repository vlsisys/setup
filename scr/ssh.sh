#! /bin/bash

# ----------------------------------------------
# [SSH]
# ----------------------------------------------
echo "ForwardX11 yes"			| sudo tee -a /etc/ssh/ssh_config
echo "ForwardX11Trusted yes"	| sudo tee -a /etc/ssh/ssh_config

echo "X11Forwarding yes"		| sudo tee -a /etc/ssh/sshd_config
echo "PermitRootLogin yes"		| sudo tee -a /etc/ssh/sshd_config
