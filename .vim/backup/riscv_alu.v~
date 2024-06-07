// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_alu.v
//	* Description	: 
// ==================================================

`ifndef	DELINC
	`include	"riscv_configs.v"
`endif

module riscv_alu
#(	
	parameter	BW_DATA	= 32,
	parameter	BW_CTRL	= 4
)
(	
	output reg	[BW_DATA-1:0]	o_alu_result,
	output						o_alu_zero,
	input		[BW_DATA-1:0]	i_alu_a,
	input		[BW_DATA-1:0]	i_alu_b,
	input		[BW_CTRL-1:0]	i_alu_ctrl
);

	always @(*) begin
		case (i_alu_ctrl)
			`ALU_CTRL_ADD	:	o_alu_result = i_alu_a +  i_alu_b;
			`ALU_CTRL_SUB	:	o_alu_result = i_alu_a -  i_alu_b;
			`ALU_CTRL_SLL	:	o_alu_result = i_alu_a << i_alu_b[4:0];
			`ALU_CTRL_SLT	:	o_alu_result = $signed(i_alu_a) < $signed(i_alu_b);
			`ALU_CTRL_SLTU	:	o_alu_result = i_alu_a <  i_alu_b;
			`ALU_CTRL_XOR	:	o_alu_result = i_alu_a ^  i_alu_b;
			`ALU_CTRL_SRL	:	o_alu_result = i_alu_a >> i_alu_b[4:0];
			`ALU_CTRL_SRA	:	o_alu_result = $signed(i_alu_a) >>> $signed(i_alu_b[4:0]);
			`ALU_CTRL_OR	:	o_alu_result = i_alu_a |  i_alu_b;
			`ALU_CTRL_AND	:	o_alu_result = i_alu_a &  i_alu_b;
		endcase
	end

	assign	o_alu_zero	= (o_alu_result == 0) ? 1'b1: 1'b0;

	`ifdef	DEBUG
		reg			[127:0]			ALU_OP;
		always @(*) begin
			case(i_alu_ctrl)
				`ALU_CTRL_ADD	:	ALU_OP	= "ADD	";
				`ALU_CTRL_SUB	:	ALU_OP	= "SUB	";
				`ALU_CTRL_SLL	:	ALU_OP	= "SLL	";
				`ALU_CTRL_SLT	:	ALU_OP	= "SLT	";
				`ALU_CTRL_SLTU	:	ALU_OP	= "SLTU	";
				`ALU_CTRL_XOR	:	ALU_OP	= "XOR	";
				`ALU_CTRL_SRL	:	ALU_OP	= "SRL	";
				`ALU_CTRL_SRA	:	ALU_OP	= "SRA	";
				`ALU_CTRL_OR	:	ALU_OP	= "OR	";
				`ALU_CTRL_AND	:	ALU_OP	= "AND	";
			endcase
		end
	`endif

endmodule
