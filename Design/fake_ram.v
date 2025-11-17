//timescale
`timescale 1ns/1ps

//module definition
module fake_ram(
	//inputs
	input I_clk,
	input I_we,
	input [15:0] I_addr,
	input [15:0] I_data,
	//outputs
	output [15:0] O_data
);
	
	//memory declaration
	reg [15:0] mem [8:0];
	
	//initial block
	initial begin
		mem[0] = 16'b0000000111111110;
		mem[1] = 16'b1001001111011101;
		mem[2] = 16'b0010001000110010;
		mem[3] = 16'b0000110000000000;
		mem[4] = 16'b1000010000000000;
		mem[5] = 16'b0000110111011101;
		mem[6] = 16'b1000000000000000;
		mem[7] = 0;
		mem[8] = 0;
		
		O_data = 16'b0000000000000000;
	end
	
	//ram operation
	always@(negedge I_clk) begin
		if(I_we) begin
			mem[I_addr[15:0]] <= I_data;
		end
		O_data <= mem[I_addr[15:0]];
	end
	

endmodule