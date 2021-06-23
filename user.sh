#! /bin/bash
# ==================================================
#  Coded by Woong
# ==================================================

# ----------------------------------------------
# [Bash Environment Setup]
# ----------------------------------------------
cp .bash_aliases ~
cp .vimrc ~
mkdir -p ~/.vim
mkdir -p ~/project
cp -rf bundle ~/.vim/

echo "======================================================================\n"
echo " To apply modification, please excute 'source ~/.bashrc'\n"
echo "======================================================================\n"

# ----------------------------------------------
# [Jupyter Qt Console for Vim User - Optional]
# ----------------------------------------------
jupyter qtconsole --generate-config
printf "\nc.ConsoleWidget.include_other_output = True\n" >> ~/.jupyter/jupyter_qtconsole_config.py

echo "======================================================================\n"
echo " For vim user, the following command can be used\n"
echo "  $ jupyter qtconsole &\n"
echo "  $ g <your_code>.py\n"
echo "======================================================================\n"
