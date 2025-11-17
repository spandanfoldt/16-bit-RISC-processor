//timescale
`timescale 1ns/1ps

//module definition
module main_test();
	//variable declaration
	//registers
	reg clk;
	reg reset;
	reg we = 0;
	reg [15:0] dataI = 0;
	//wires
	wire [2:0] selA;
	wire [2:0] selB;
	wire [2:0] selD;
	wire [15:0] dataA;
	wire [15:0] dataB;
	wire [15:0] dataD;
	wire [4:0] aluop;
	wire [1:0] imm;
	wire [1:0] opcode;
	wire [15:0] dataO;
	wire [15:0] pcO;
	wire shldBranch;
	wire enfetch;
	wire enalu;
	wire endec;
	wire enmem;
	wire enrgrd;
	wire enrgwr;
	
	
	//assignments
	assign opcode = (reset) ? 2'b11 : ((shldBranch) ? 2'b10 : ((we) ? 2'b01 : 2'b00));
//instantiations	
reg_file main_reg(
	//inputs
	clk,
	en,
	we,
	selA,
	selB,
	selD,
	dataD,
	//outputs
	dataA,
	dataB
);

inst_dec main_inst(
	//inputs
	clk,
	en,
	inst,
	
	//outputs
	aluop,
	selA,
	selB,
	selD,
	imm,
	regwe
);

alu main_alu(
	//inputs
	clk,
	en,
	aluop,
	dataA,
	dataB,
	imm,
	//outputs
	dataResult,
	shldBranch
	
);

ctrl_unit main_ctrl(

	//inputs
	clk,
	reset,
	
	//outputs
	enfetch,
	endec,
	enrgrd,
	enalu,
	enrgwr,
	enmem
);

fake_ram main_ram(
	//inputs
	clk,
	we,
	addr,
	dataI,
	//outputs
	dataO
);

pc_unit pc_main(
	//inputs
	clk,
	opcode,
	dataD,
	//outputs
	pcO
);

	initial begin
	
		clk  = 0;
		reset = 1;
		#20;
		reset = 0;
	
	end
	
	//clock generation
	always begin
		#5;
		I_clk = ~I_clk;
	end


endmodule