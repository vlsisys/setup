# ----------------------------------------------
# [Prompt & Env. Variables]
# ----------------------------------------------
export	PATH=$PATH:$HOME/utils/riscv/toolchain/bin:$HOME/utils/riscv/bin/

export	PS1="[\[\e[0;36m\]\u - \[\e[0;37m\]\D{%Y.%m.%d} \t\[\e[0;39m\]]\n\[\e[0;31m\]\${PWD}: \[\e[0;39m\]"
#export	DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
export	GDK_SCALE=1
#source	/opt/pkg/petalinux-v2021.1/settings.sh
#source	/tools/Xilinx/Vivado/2020.2/settings64.sh
tmux

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
alias	rvgdb='riscv64-unknown-linux-gnu-gdb $1'
alias	rvdump='riscv64-unknown-linux-gnu-objdump -S $1'
alias	vg='source ~/venv/gem5/bin/activate'
alias	gem5='~/projects/gem5/build/RISCV/gem5.opt $1'

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
	if [ -f $1_tb.f ]; then
		iverilog -o $1.vvp -c $1_tb.f
	else
		iverilog -o $1.vvp timescale.v $1_tb.v
	fi
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
	if [ -f $1_tb.f ]; then
		iverilog -o $1.vvp -c $1_tb.f
	else
		iverilog -o $1.vvp timescale.v $1_tb.v
	fi
	vvp	$1.vvp +vcd_file=./vcd/$1.vcd > ./log/$1.log
	rm $1.vvp
}

export	-f ivg
export	-f iv

function	rvgcc(){
	echo '======================================================================'
	echo ' RISC-V GNU GCC'
	echo '======================================================================'
	riscv64-unknown-linux-gnu-gcc -march=rv32i -mabi=ilp32  -Ttext=0x0000 -c -o test $1
#	riscv64-unknown-linux-gnu-gcc -march=rv32i -mabi=ilp32 -Ttext=0 -nostdlib test.c -o test
	riscv64-unknown-linux-gnu-objdump -d test > test.dump
	riscv64-unknown-linux-gnu-objcopy -O ihex test test.hex
	srec_cat test.hex -binary -o test.mif -mif
	#riscv64-unknown-linux-gnu-gcc -march=rv32i -mabi=ilp32 -c -o start.o start.S
	#riscv64-unknown-linux-gnu-gcc -march=rv32i -mabi=ilp32 -c -o $1.o $1
	##riscv64-unknown-linux-gnu-ld  $1.o start.o -L riscv64-unknown-linux-gnu/lib/ -Tlink.ld -static -o $1.elf
	#riscv64-unknown-linux-gnu-ld  -march=rv32i -mabi=elf32briscv_ilp32 $1.o start.o -L riscv64-unknown-linux-gnu/lib/ -Tlink.ld -static -o $1.elf
	#riscv64-unknown-linux-gnu-objcopy -O binary $1.elf $1.bin
	#riscv64-unknown-linux-gnu-gcc -march=rv32i -mabi=ilp32 -nostdlib -o $1.o $1 ctr0local.S -lgcc
	#riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -o test test.c crt0local.S -lgcc
	#riscv64-unknown-linux-gnu-gcc -march=rv32i -mabi=ilp32 -o test test.c ./crt0local.S -lgcc
	#-march=rv32i -mabi=ilp32 -o $1.o $1 ctr0local.S -lgcc

}
