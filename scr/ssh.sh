#! /bin/bash

# ----------------------------------------------
# [SSH]
# ----------------------------------------------
printf "\n"							>> /etc/ssh/ssh_config
printf "\tForwardX11 yes\n"			>> /etc/ssh/ssh_config
printf "\tForwardX11Trusted yes\n"	>> /etc/ssh/ssh_config

printf "\n"							>> /etc/ssh/sshd_config
printf "\tX11Forwarding yes\n"		>> /etc/ssh/sshd_config
printf "\tPermitRootLogin yes\n"	>> /etc/ssh/sshd_config
