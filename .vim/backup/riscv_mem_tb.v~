// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_mem_tb.v
//	* Description	: 
// ==================================================

// --------------------------------------------------
//	Define Global Variables
// --------------------------------------------------
`define	CLKFREQ		100		// Clock Freq. (Unit: MHz)
`define	SIMCYCLE	2**BW_ADDR

`include	"riscv_mem.v"

module riscv_mem_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------
	localparam	BW_DATA			= 32;
	localparam	BW_ADDR			= 5;

	wire	[BW_DATA-1:0]	o_mem_data;
	reg		[BW_DATA-1:0]	i_mem_data;
	reg		[BW_ADDR-1:0]	i_mem_addr;
	reg						i_mem_wr_en;
	reg						i_clk;

	riscv_mem
	#(
		.BW_DATA			(BW_DATA			),
		.BW_ADDR			(BW_ADDR			),
		.INIT_FILE			("riscv_mem.mif"	)
	)
	u_riscv_mem(
		.o_mem_data			(o_mem_data			),
		.i_mem_data			(i_mem_data			),
		.i_mem_addr			(i_mem_addr			),
		.i_mem_wr_en		(i_mem_wr_en		),
		.i_clk				(i_clk				)
	);
// --------------------------------------------------
//	Clock
// --------------------------------------------------
	always	#(500/`CLKFREQ)	i_clk = ~i_clk;

// --------------------------------------------------
//	Tasks
// --------------------------------------------------
	reg		[4*32-1:0] taskState;	// Length is limitted to 32

	task init;
		begin
			i_mem_data			= 0;
			i_mem_addr			= 0;
			i_mem_wr_en			= 0;
			i_clk				= 0;
		end
	endtask

	task memWR;
		input	[BW_ADDR-1:0]	ti_mem_addr;
		input	[BW_DATA-1:0]	ti_mem_data;
		begin
			taskState	= "WR";
			@(negedge i_clk) begin
			//	$display ("==================================================");
				$display ("%8g Write (%d) @ #(%d) of ResisterFile", $time, ti_mem_data, ti_mem_addr);
				i_mem_data	= ti_mem_data;
				i_mem_addr	= ti_mem_addr;
				i_mem_wr_en	= 1;
			end
		end
	endtask

	task memRD;
		input	[BW_ADDR-1:0]	ti_mem_addr;
		begin
			taskState	= "RD";
			@(negedge i_clk) begin
				i_mem_addr	= ti_mem_addr;
				i_mem_wr_en	= 0;
			end
			@(posedge i_clk) begin
//				$display ("==================================================");
				$display ("%8g  Read (%d) @ #(%d) of ResisterFile", $time, o_mem_data, i_mem_addr);
			end
		end
	endtask

	task singleCycle;
		begin
			#(1000/`CLKFREQ);
		end
	endtask

// --------------------------------------------------
//	Test Stimulus
// --------------------------------------------------
	integer		i, j;
	initial begin
		init();

		memRD(0);
		#(1000/`CLKFREQ);
		memRD(1);
		#(1000/`CLKFREQ);
		memRD(2);
		#(1000/`CLKFREQ);
		memRD(3);
		#(1000/`CLKFREQ);
		memRD(4);
		#(1000/`CLKFREQ);
		for (i=0; i<`SIMCYCLE; i++) begin
			memWR(i, i);
			#(1000/`CLKFREQ);
		end
		for (i=0; i<`SIMCYCLE; i++) begin
			memRD(i);
			#(1000/`CLKFREQ);
		end
		for (i=0; i<`SIMCYCLE; i++) begin
			memWR(i, $urandom);
			#(1000/`CLKFREQ);
			memRD(i);
			#(1000/`CLKFREQ);
		end
		$finish;
	end

// --------------------------------------------------
//	Dump VCD
// --------------------------------------------------
	reg	[8*32-1:0]	vcd_file;
	initial begin
		if ($value$plusargs("vcd_file=%s", vcd_file)) begin
			$dumpfile(vcd_file);
			for (i=0; i<2**BW_ADDR; i++) begin
				$dumpvars(0, u_riscv_mem.mem_arr[i]);
			end
			$dumpvars;
		end else begin
			$dumpfile("riscv_mem_tb.vcd");
			$dumpvars;
		end
	end

endmodule
