//timescale
`timescale 1ns/1ps

//module definition
module regfile_unittests();
	//variable declaration
	//registers
	reg I_clk;
	reg I_en;
	reg I_we;
	reg I_selA;
	reg I_selB;
	reg I_selD;
	reg I_dataD;
	//wires
	wire O_dataA;
	wire O_dataB;

reg_file reg_test(
	//inputs
	I_clk,
	I_en,
	I_we,
	I_selA,
	I_selB,
	I_selD,
	I_dataD,
	//outputs
	O_dataA,
	O_dataB
);
	/* Testing Process for reference
	 * 1) Read r0 and r1, write 0xFFFF to r0
	 * 2) Ensure 0xFFFF appears on data out line, write 0x2222 to r2
	 * 3) Write 0x3333 to r2, testing multiple writes to same location
	 * 4) Set up as tho writing 0xFEED to r0 but dont enable the I_we
	 * 5) Write 0x4444 to r4, ensure 0xFEED was not written to r0
	 * 6) After waiting multiple clock cycles, read r4 on both output A and B
	 */


	initial begin
		
		I_clk = 1'b0;
		I_dataD = 0;
		I_en = 0;
		I_selA = 0;
		I_selB = 0;
		I_selD = 0;
		I_we = 0;
		
		//start test
		//time = 7
		#7;
		I_en = 1'b1;
		I_selA = 3'b000;
		I_selB = 3'b001;
		I_selD = 3'b000;
		
		I_dataD = 16'hFFFF;
		I_we = 1'b1;
		
		//time = 17
		#10;
		I_we = 1'b0;
		I_selD = 3'b010;
		I_dataD = 16'h2222;
		
		//time = 27
		#10;
		I_we = 1;
		
		//time = 37
		#10;
		I_dataD = 16'h3333;
		
		//time = 47
		#10;
		I_we = 0;
		I_selD = 3'b000;
		I_dataD = 16'hFEED;
		
		//time = 57
		#10;
		I_selD = 3'b100;
		I_dataD = 16'h4444;
		
		// time = 67;
		I_we = 1;
		
		//time = 117;
		#50;
		I_selA = 3'b100;	
		I_selB = 3'b100;	
		
	end
	
	//clock generation
	always begin
		#5;
		I_clk = ~I_clk;
	end


endmodule