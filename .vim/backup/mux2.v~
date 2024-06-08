// ==================================================
//	[ VLSISYS Lab. ]
//	* Filename		: mux2.v
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Description	: 
// ==================================================

module	mux2_primitive
(
	output		o_out,
	input		i_sel,
	input		i_in0,
	input		i_in1
);
	wire		sel_n;
	wire		out_0;
	wire		out_1;

	not	u_not0	(sel_n , i_sel         ) ;
	and	u_and0	(out_0 , i_in0 , sel_n ) ;
	and	u_and1	(out_1 , i_in1 , i_sel ) ;
	or	u_or0	(o_out , out_0 , out_1 ) ;

endmodule

module	mux2_assign
(
	output		o_out,
	input		i_sel,
	input		i_in0,
	input		i_in1
);

	assign	o_out	= i_sel ? i_in1 : i_in0;

endmodule

module	mux2_if
(
	output reg	o_out,
	input		i_sel,
	input		i_in0,
	input		i_in1
);

	always @(*) begin
		if (i_sel == 0) begin
			o_out	= i_in0;
		end else begin
			o_out	= i_in1;
		end
	end

endmodule

module	mux2_case
(
	output reg	o_out,
	input		i_sel,
	input		i_in0,
	input		i_in1
);

	always @(*) begin
		case(i_sel)
			0:			o_out = i_in0;
			1:			o_out = i_in1;
			//default:	o_out = i_in1;
		endcase
	end

endmodule
