//timescale
`timescale 1ns/1ps

//module definition
module decoder_unittests();
	//variable declaration
	//registers
	reg I_Clk;
	reg I_En;
	reg [15:0] I_Inst;
	//wires
	wire [4:0] O_Aluop;
	wire [3:0] O_SelA;
	wire [3:0] O_SelB;
	wire [3:0] O_SelD;
	wire [15:0] O_Imm;
	wire O_Regwe;
	
	
	
inst_dec inst_unit(
	//inputs
	I_Clk,
	I_En,
	I_Inst,
	
	//outputs
	O_Aluop,
	O_SelA,
	O_SelB,
	O_SelD,
	O_Imm,
	O_Regwe
);

	initial begin
	//time = 0
		I_Clk <= 0;
		I_En <= 0;
		I_Inst <= 0;
	//time = 10
		#10;
		I_Inst = 16'b0001011100000100;
	//time = 10;
		#10;
		I_En = 1;
	
	end
	
	always begin
		#5;
		I_Clk = ~I_Clk;
	end

endmodule