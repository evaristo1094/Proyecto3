`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:35:49 10/22/2016
// Design Name:   Instanciacion_Teclado
// Module Name:   C:/Users/Evaristo/Documents/Verilog/proyecto3/Test_Teclado.v
// Project Name:  proyecto3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Instanciacion_Teclado
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Teclado;

	// Inputs
	reg clk;
	reg reset;
	reg ps2d;
	reg ps2c;
	reg [7:0]port_id;
	reg read_strobe;

	// Outputs
	wire [7:0] dato;

	// Instantiate the Unit Under Test (UUT)
	Instanciacion_Teclado uut (
		.clk(clk), 
		.reset(reset), 
		.ps2d(ps2d), 
		.ps2c(ps2c), 
		.read_strobe(read_strobe),
	   .port_id(port_id),
		.dato(dato)
	);

	
        
//Para generar clock de 100 MHz
	initial begin
	clk = 0;
	forever #5 clk = ~clk;
	end

	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		ps2d = 0;
		ps2c = 0;
			
		// Wait 100 ns for global reset to finish
		#100;
		
		reset = 0;
        
		// Add stimulus here
		port_id = 8'h00;
		read_strobe = 1'b0;
		//F0
		#50005
		ps2c = 1;
		ps2d = 0;//Bit de inicio
		
		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 0 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 1 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 2 (1C)
		
		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 3 (1C)
		
		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit 4 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit 5 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit 6 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit 7 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit paridad (par=1)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit parada
		
		#50000
		ps2c = 0;

		//1C
		#50000
		ps2c = 1;
		ps2d = 0;//Bit de inicio
		
		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 0 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 1 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit 2 (1C)
		
		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit 3 (1C)
		
		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit 4 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 5 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 6 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 7 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit paridad (par=1)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit parada
		
		#50000
		ps2c = 0;
		#50000
		ps2c = 1;
		#50000
		ps2c = 0;
		#5000
		port_id = 8'h0a;
		read_strobe = 1'b1;
		#20
		port_id = 8'h6a;
		read_strobe = 1'b0;
		
		//F0
		#50005
		ps2c = 1;
		ps2d = 0;//Bit de inicio
		
		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 0 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 1 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 2 (1C)
		
		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 3 (1C)
		
		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit 4 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit 5 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit 6 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit 7 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit paridad (par=1)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit parada
		
		#50000
		ps2c = 0;

		//04
		#50000
		ps2c = 1;
		ps2d = 0;//Bit de inicio
		
		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 0 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 1 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit 2 (1C)
		
		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 3 (1C)
		
		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 4 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 5 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 6 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 0;//Bit 7 (1C)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit paridad (par=1)

		#50000
		ps2c = 0;
		
		#50000
		ps2c = 1;
		ps2d = 1;//Bit parada
		
		#50000
		ps2c = 0;
		#50000
		ps2c = 1;
		#50000
		ps2c = 0;
		#5000
		port_id = 8'h0a;
		read_strobe = 1'b1;
		#20
		port_id = 8'h6a;
		read_strobe = 1'b0;
		#200000$stop;		
	end
      
endmodule

