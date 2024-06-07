// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_cpu.v
//	* Description	: 
// ==================================================

`ifndef	DELINC
	`include	"riscv_ctrl.v"
	`include	"riscv_datapath.v"
`endif

module riscv_cpu
#(	
	parameter	BW_D_IME			= 32,
	parameter	BW_A_IME			= 16,
	parameter	BW_A_DME			= 16,
	parameter	BW_D_REG			= 32,
	parameter	BW_A_REG			= 5,
	parameter	BW_C_ALU			= 4,
	parameter	BW_C_IMM			= 3,
	parameter	BW_C_RES			= 2
)
(	
	output		[BW_A_IME-1:0]		o_cpu_imem_pc,
	output		[BW_D_REG-1:0]		o_cpu_dmem_addr,
	output							o_cpu_dmem_wr_en,
	output		[BW_D_REG-1:0]		o_cpu_dmem_wr_data,
	input		[BW_D_REG-1:0]		i_cpu_dmem_rd_data,
	input		[BW_D_IME-1:0]		i_cpu_imem_instr,
	input							i_clk,
	input							i_rstn
);

	wire							w_cpu_src_pc;
	wire							w_cpu_src_alu_a;
	wire							w_cpu_src_alu_b;
	wire		[BW_C_IMM-1:0]		w_cpu_src_imm;
	wire		[BW_C_RES-1:0]		w_cpu_src_result;
	wire							w_cpu_reg_wr;
	wire		[BW_C_ALU-1:0]		w_cpu_alu_ctrl;
	wire							w_cpu_alu_zero;

	riscv_ctrl
	#(
		.BW_C_ALU			(BW_C_ALU				),
		.BW_C_IMM			(BW_C_IMM				),
		.BW_C_RES			(BW_C_RES				)
	)
	u_riscv_ctrl(
		.o_ctrl_src_pc		(w_cpu_src_pc			),
		.o_ctrl_src_alu_a	(w_cpu_src_alu_a		),
		.o_ctrl_src_alu_b	(w_cpu_src_alu_b		),
		.o_ctrl_src_imm		(w_cpu_src_imm			),
		.o_ctrl_src_result	(w_cpu_src_result		),
		.o_ctrl_reg_wr		(w_cpu_reg_wr			),
		.o_ctrl_mem_wr		(o_cpu_dmem_wr_en		),
		.o_ctrl_alu_ctrl	(w_cpu_alu_ctrl			),
		.i_ctrl_alu_zero	(w_cpu_alu_zero			),
		.i_ctrl_opcode		(i_cpu_imem_instr[6:0]	),
		.i_ctrl_funct3		(i_cpu_imem_instr[14:12]),
		.i_ctrl_funct7_5b	(i_cpu_imem_instr[30]	)
	);

	riscv_datapath
	#(
		.BW_D_IME			(BW_D_IME				),
		.BW_A_IME			(BW_A_IME				),
		.BW_D_REG			(BW_D_REG				),
		.BW_A_REG			(BW_A_REG				),
		.BW_C_ALU			(BW_C_ALU				),
		.BW_C_IMM			(BW_C_IMM				),
		.BW_C_RES			(BW_C_RES				)
	)
	u_riscv_datapath(
		.o_dp_pc			(o_cpu_imem_pc			),
		.o_dp_alu_zero		(w_cpu_alu_zero			),
		.o_dp_alu_result	(o_cpu_dmem_addr		),
		.o_dp_dmem_wr_data	(o_cpu_dmem_wr_data		),
		.i_dp_dmem_rd_data	(i_cpu_dmem_rd_data		),
		.i_dp_instr			(i_cpu_imem_instr		),
		.i_dp_src_pc		(w_cpu_src_pc			),
		.i_dp_src_alu_a		(w_cpu_src_alu_a		),
		.i_dp_src_alu_b		(w_cpu_src_alu_b		),
		.i_dp_src_imm		(w_cpu_src_imm			),
		.i_dp_src_result	(w_cpu_src_result		),
		.i_dp_reg_wr		(w_cpu_reg_wr			),
		.i_dp_alu_ctrl		(w_cpu_alu_ctrl			),
		.i_clk				(i_clk					),
		.i_rstn				(i_rstn					)
	);

endmodule
