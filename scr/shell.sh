# ----------------------------------------------
# [Bash Environment Setup]
# ----------------------------------------------
cp .bash_aliases			~
cp .vimrc					~
mkdir -p					~/.vim
mkdir -p					~/project
cp -rf bundle				~/.vim/
cp -rf ./fonts/VictorMono	/usr/share/fonts/truetype/

source ~/.bashrc
