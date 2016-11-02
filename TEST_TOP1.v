`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:32:14 09/27/2016
// Design Name:   top_proyII_digitales
// Module Name:   C:/Users/Evaristo/Documents/Verilog/Proyecto2/TEST_TOP1.v
// Project Name:  Proyecto2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_proyII_digitales
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TEST_TOP1;

	// Inputs
	reg clk;
	reg reset;
	reg ps2c;
	reg ps2d;
	

	// Outputs
	wire [6:0] text_on_out;
	wire [2:0] text_RGB_out;
	wire h_sync;
	wire v_sync;
	wire CSO;
	wire WRO;
	wire RDO;
	wire ADO;

	// Bidirs
	wire [7:0] Bus_Dato_Dire;

	// Instantiate the Unit Under Test (UUT)
	top_proyII_digitales uut (
		.clk(clk), 
		.reset(reset), 
		.ps2c(ps2c),
		.ps2d(ps2d),
		.text_on_out(text_on_out), 
		.text_RGB_out(text_RGB_out), 
		.h_sync(h_sync), 
		.v_sync(v_sync), 
		.CSO(CSO), 
		.WRO(WRO), 
		.RDO(RDO), 
		.ADO(ADO), 
		.Bus_Dato_Dire(Bus_Dato_Dire)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		#100
		
		reset = 1;
		#100
		
		reset = 0;
		#100

		ps2d = 0;
		ps2c = 0;
			
		// Wait 100 ns for global reset to finish
	
		// Add stimulus here
		
		//F0
		#505
		ps2c = 1;
		ps2d = 0;//Bit de inicio
		
		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 0 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 1 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 2 (1C)
		
		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 3 (1C)
		
		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit 4 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit 5 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit 6 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit 7 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit paridad (par=1)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit parada
		
		#500
		ps2c = 0;

		//0C
		#500
		ps2c = 1;
		ps2d = 0;//Bit de inicio
		
		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 0 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 1 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit 2 (1C)
		
		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit 3 (1C)
		
		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 4 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 5 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 6 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 7 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit paridad (par=1)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit parada
		
		#500
		ps2c = 0;
		#500
		ps2c = 1;
		#500
		ps2c = 0;
		#500
		
		
		//F0
		#505
		ps2c = 1;
		ps2d = 0;//Bit de inicio
		
		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 0 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 1 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 2 (1C)
		
		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 3 (1C)
		
		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit 4 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit 5 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit 6 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit 7 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit paridad (par=1)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit parada
		
		#500
		ps2c = 0;

		//04
		#500
		ps2c = 1;
		ps2d = 0;//Bit de inicio
		
		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 0 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 1 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit 2 (1C)
		
		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 3 (1C)
		
		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 4 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 5 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 6 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 0;//Bit 7 (1C)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit paridad (par=1)

		#500
		ps2c = 0;
		
		#500
		ps2c = 1;
		ps2d = 1;//Bit parada
		
		#500
		ps2c = 0;
		#500
		ps2c = 1;
		#500
		ps2c = 0;
		#500
		
		#2000$stop;		
	end
     always  begin
			#5	clk = ~clk;
		end
endmodule

