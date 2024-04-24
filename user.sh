#! /bin/bash
# ==================================================
#  Coded by Woong
# ==================================================

# ----------------------------------------------
# [Bash Environment Setup]
# ----------------------------------------------
echo "======================================================================\n"
echo " Bash Environment Setup\n"
echo "======================================================================\n"
cp .bash_aliases ~
cp .vimrc ~
mkdir -p ~/project
mkdir -p ~/.vim
cp -rf bundle ~/.vim/

echo " To apply modification, please excute following command!\n"
echo " $ 'source ~/.bashrc'\n"

# ----------------------------------------------
# [Jupyter Server]
# ----------------------------------------------
jupyter-lab --generate-config
jupyter-lab password

pwdFile=~/.jupyter/jupyter_server_config.json
jupyterServerPassWord=`head -n 3 ${pwdFile} | tail -1 | cut -f 4 -d \"`

printf "\n" 													>>	~/.jupyter/jupyter_lab_config.py
printf "c.ServerApp.ip = '*'\n" 								>>	~/.jupyter/jupyter_lab_config.py
#printf "c.ServerApp.port = 8888\n" 							>>	~/.jupyter/jupyter_lab_config.py
printf "c.ServerApp.port_retries = 0\n" 						>>	~/.jupyter/jupyter_lab_config.py
printf "c.ServerApp.password = '${jupyterServerPassWord}'\n" 	>>	~/.jupyter/jupyter_lab_config.py

case $USER in
	"root")
		echo "======================================================================"
		echo " Error: User [$USER]'s jupyter port is not permitted!!!"
		echo "======================================================================"
		;;
	"woong")
		port_num=8888
		;;
	"yyj")
		port_num=8890
		;;
	"jaeeun")
		port_num=8989
		;;
	"jungeun")
		port_num=8891
		;;
	"dain")
		port_num=8892
		;;
esac
		printf "c.ServerApp.port = $port_num\n" 	>>	~/.jupyter/jupyter_lab_config.py
		echo "======================================================================"
		echo " User [$USER]'s jupyter port is assigned as [$port_num]"
		echo "======================================================================"
		echo "    Please follow the guides for putty configurations"
		echo "______________________________________________________________________"
		echo "    1. PuTTY Configuration > Connection > SSH > Tunnels"
		echo "    2. Source port: $port_num"
		echo "    3. Destination: localhost:$port_num"

# ----------------------------------------------
# [Jupyter Qt Console for Vim User - Optional]
# ----------------------------------------------
#echo "======================================================================\n"
#echo " Jupyter Qt Console for Vim User - Optional'\n"
#echo "======================================================================\n"
#jupyter qtconsole --generate-config
#printf "\nc.ConsoleWidget.include_other_output = True\n" >> ~/.jupyter/jupyter_qtconsole_config.py
#
#echo " For vim user, the following command can be used\n"
#echo "  $ jupyter qtconsole &\n"
#echo "  $ g <your_code>.py\n"
#echo "  @vim JupyterConnect\n"
#echo "  @vim JupyterRunFile\n"
