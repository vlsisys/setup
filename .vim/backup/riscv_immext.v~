// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_immext.v
//	* Description	: 
// ==================================================

`include	"riscv_configs.v"

module riscv_immext
#(
	parameter	BW_DATA	= 32,
	parameter	BW_CTRL	= 3 
)
(	
	output reg	[BW_DATA-1:0]	o_imm_ext,
	input		[BW_DATA-1:0]	i_imm_instr,
	input		[BW_CTRL-1:0]	i_imm_src
);

	always @(*) begin
		case(i_imm_src) 
			`INSTR_I_TYPE	:	o_imm_ext	= {{20{i_imm_instr[31   ]}}, i_imm_instr[31:20]													};  
			`INSTR_S_TYPE	:	o_imm_ext	= {{20{i_imm_instr[31   ]}}, i_imm_instr[31:25], i_imm_instr[11: 7]								}; 
			`INSTR_B_TYPE	:	o_imm_ext	= {{20{i_imm_instr[31   ]}}, i_imm_instr[7    ], i_imm_instr[30:25], i_imm_instr[11: 8], 1'b0	}; 
			`INSTR_U_TYPE	:	o_imm_ext	= {    i_imm_instr[31:12]  , 12'b0																}; 
			`INSTR_J_TYPE	:	o_imm_ext	= {{12{i_imm_instr[31   ]}}, i_imm_instr[19:12], i_imm_instr[20   ], i_imm_instr[30:21], 1'b0	}; 
			default			:	o_imm_ext	= {BW_DATA{1'bx}};
		endcase             
	end

endmodule
