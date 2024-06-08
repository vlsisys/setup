// ==================================================
//	[ VLSISYS Lab. ]
//	* Filename		: mux2_tb.v
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Description	: 
//		- Key Points
//			1. 
//			2. 
// ==================================================

// --------------------------------------------------
//	Define Global Variables
// --------------------------------------------------
//	Clock
`define	CLKFREQ		100		// Unit: MHz
`define	SIMCYCLE	100

`include	"mux2.v"

module	mux2_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------
	wire		o_out_primitive;
	wire		o_out_assign;
	wire		o_out_if;
	wire		o_out_case;
	reg			i_sel;
	reg			i_in0;
	reg			i_in1;

	mux2_primitive
	u_mux2_primitive
	(	
		.o_out		(o_out_primitive	),
		.i_sel		(i_sel				),
		.i_in0		(i_in0				),
		.i_in1		(i_in1				)
	);
	
	mux2_assign
	u_mux2_assign
	(	
		.o_out		(o_out_assign		),
		.i_sel		(i_sel				),
		.i_in0		(i_in0				),
		.i_in1		(i_in1				)
	);

	mux2_if
	u_mux2_if
	(	
		.o_out		(o_out_if			),
		.i_sel		(i_sel				),
		.i_in0		(i_in0				),
		.i_in1		(i_in1				)
	);

	mux2_case
	u_mux2_case
	(	
		.o_out		(o_out_case			),
		.i_sel		(i_sel				),
		.i_in0		(i_in0				),
		.i_in1		(i_in1				)
	);

// --------------------------------------------------
//	Test Stimulus
// --------------------------------------------------
	integer		i, j, k, n;
	initial begin
		for (i=0; i<`SIMCYCLE; i++) begin
			{i_sel, i_in0, i_in1} = $urandom_range(0,7);
			//i_sel = 1;
			#(1000/`CLKFREQ);
		end
	end

	reg	[8*32-1:0]	vcd_file;
	initial begin
		if ($value$plusargs("vcd_file=%s", vcd_file)) begin
			$dumpfile(vcd_file);
			$dumpvars;
		end
	end

endmodule
