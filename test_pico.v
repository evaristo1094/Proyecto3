`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:01:54 11/01/2016
// Design Name:   pico_top
// Module Name:   C:/.Xilinx/digitales3/test_pico.v
// Project Name:  digitales3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pico_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_pico;

	// Inputs
	reg clk;
	reg cpu_reset;
	reg [7:0] in_port;

	// Outputs
	wire write_strobeS;
	wire read_strobeS;
	wire [7:0]out_portS;
	wire [7:0]port_idS;
	wire k_write_strobe;
	wire interrupt_ack;

	// Instantiate the Unit Under Test (UUT)
	pico_top uut (
		.clk(clk), 
		.cpu_reset(cpu_reset), 
		.in_port(in_port), 
		.write_strobeS(write_strobeS), 
		.read_strobeS(read_strobeS), 
		.out_portS(out_portS), 
		.port_idS(port_idS), 
		.k_write_strobe(k_write_strobe), 
		.interrupt_ack(interrupt_ack)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		cpu_reset = 0;
		in_port = 0;

		// Wait 100 ns for global reset to finish
		#100;
		//cpu_reset = 1;
		#50;
		//cpu_reset =0;
		in_port = 8'b 11110011;
		#600;
		//cpu_reset = 1;
		#50;
		//cpu_reset =0;
		in_port = 8'b 01100000;
	

       

	end
	always  begin
		#5	clk= ~clk;
		end 
	
      
endmodule

