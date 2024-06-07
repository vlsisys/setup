// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_mem.v
//	* Description	: 
// ==================================================

`include	"riscv_configs.v"

module riscv_mem
#(	
	parameter	BW_DATA				= 32,
	parameter	BW_ADDR				= 4,
	parameter	INIT_FILE			= ""
)
(	
	output		[BW_DATA-1:0]		o_mem_data,
	input		[BW_DATA-1:0]		i_mem_data,
	input		[BW_ADDR-1:0]		i_mem_addr,
	input							i_mem_wr_en,
	input							i_clk
);

	reg			[BW_DATA-1:0]	mem_arr[0:2**BW_ADDR-1];
	initial		$readmemh(INIT_FILE, mem_arr);

	assign		o_mem_data = (i_mem_wr_en) ? o_mem_data : mem_arr[i_mem_addr];

	always @(posedge i_clk) begin
		if (i_mem_wr_en) begin
			mem_arr[i_mem_addr] <= i_mem_data;
		end else begin
			mem_arr[i_mem_addr] <= mem_arr[i_mem_addr];
		end
	end

endmodule
