# ----------------------------------------------
# [Prompt & Env. Variables]
# ----------------------------------------------
export	PATH=$PATH:$HOME/utils/riscv/toolchain/bin:$HOME/utils/riscv/bin/

export	PS1="[\[\e[0;36m\]\u - \[\e[0;37m\]\D{%Y.%m.%d} \t\[\e[0;39m\]]\n\[\e[0;31m\]\${PWD}: \[\e[0;39m\]"
export	DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
export	GDK_SCALE=1
#source	/opt/pkg/petalinux-v2021.1/settings.sh
#source	/tools/Xilinx/Vivado/2020.2/settings64.sh

# ----------------------------------------------
# [Alias]: empty space is not allowed btw. alias & cmd
# ----------------------------------------------
alias	src='source ~/.bashrc'
alias	g='gvim -p  > /dev/null'
#alias	g='gvim -v'
#alias	t='gnome-terminal --disable-factory&'
alias	t='gnome-terminal --geometry=108x18&'
alias	ju='jupyter-lab --no-browser --ServerApp.root_dir=~/project'
alias	gitpush='git add .; git commit -m 'comment'; git push -u origin +master;'
alias	ipy2py='jupyter nbconvert --to python $1'
alias	untar='tar -xvf $1'
alias	untargz='tar -zxvf $1'

# ----------------------------------------------
# [Functions]
# ----------------------------------------------
function	cd	{ if (( $#==0 )); then builtin cd ~ && ls; else builtin cd "$@" && ls; fi }
cd		.

function	ivg(){
	echo '======================================================================'
	echo ' Icarus Verilog w/ GTKWave for' [${1}]
	echo '======================================================================'
	rm -rf vcd log
	mkdir -p vcd log
	ln -fs ~/templates/verilog/timescale.v timescale.v 
	iverilog -o $1.vvp timescale.v $1_tb.v
	vvp	$1.vvp +vcd_file=./vcd/$1.vcd > ./log/$1.log
	rm $1.vvp
	gtkwave -f ./vcd/$1.vcd -T ~/utils/scripts/gtkwv.tcl &
}

function	iv(){
	echo '======================================================================'
	echo ' Icarus Verilog w/o GTKWave for' [${1}]
	echo '======================================================================'
	rm -rf vcd log
	mkdir -p vcd log
	ln -fs ~/templates/verilog/timescale.v timescale.v 
	iverilog -o $1.vvp timescale.v $1_tb.v
	vvp	$1.vvp +vcd_file=./vcd/$1.vcd > ./log/$1.log
	rm $1.vvp
}

export	-f ivg
export	-f iv

