# ----------------------------------------------
# [Bash Environment Setup]
# ----------------------------------------------
cp .bash_aliases			~
cp .vimrc					~
mkdir -p					~/projects
mkdir -p					~/utils
mkdir -p					~/.vim
cp -rf bundle				~/.vim/
cp -rf ./fonts/VictorMono	/usr/share/fonts/truetype/

source ~/.bashrc
