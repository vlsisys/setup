# ----------------------------------------------
# [Bash Environment Setup]
# ----------------------------------------------
cp -rf 		./.bash_aliases		~	
cp -rf 		./.vimrc			~	
cp -rf 		./.vim				~	
cp -rf 		./fonts/Sudo			/usr/share/fonts/truetype/
cp -rf 		./fonts/VictorMono		/usr/share/fonts/truetype/
cp -rf 		./fonts/JetBrainsMono	/usr/share/fonts/truetype/

mkdir -p	~/projects
mkdir -p	~/utils

source		~/.bashrc
