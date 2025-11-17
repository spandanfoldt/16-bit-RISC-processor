//timescale
`timescale 1ns/1ps

//module definition
module reg_file(
	//inputs
	input I_clk,
	input I_en,
	input I_we,
	input [3:0] I_selA,
	input [3:0] I_selB,
	input [3:0] I_selD,
	input [3:0] I_dataD,
	//outputs
	output [15:0] O_dataA,
	output [15:0] O_dataB
);

	//internal register declaration
	reg [15:0] regs [7:0];
	
	//loop variable
	integer count;
	
	//initial registers
	initial begin
		O_dataA <= 0;
		O_dataB <= 0;
		
		for(count = 0; count < 8; count = count+1) begin
			regs[count] <= 0;
		end
		
			
		//assigning correct values to OP regs
		
	end
	always@(negedge I_clk) begin
			if(I_en) begin
				if(I_we)
					regs[I_selD] <= I_dataD;
				
				O_dataA <= regs[I_selA];
				O_dataB <= regs[I_selB];
			end
		end



endmodule