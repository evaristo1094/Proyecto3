`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:31:06 09/08/2016
// Design Name:   Maquina_Escritura
// Module Name:   C:/Users/Evaristo/Documents/Verilog/Proyecto2/test_maq_esc.v
// Project Name:  Proyecto2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Maquina_Escritura
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_maq_esc;

	// Inputs
	reg clk;
	reg reset;
	reg Escritura;
	reg [7:0] Seg;
	reg [7:0] Min;
	reg [7:0] Hora;
	reg [7:0] Ano;
	reg [7:0] Mes;
	reg [7:0] Dia;

	// Outputs
	wire CS;
	wire WR;
	wire RD;
	wire AD;
	wire Term_Esc;
	wire [7:0] Dato_Dire;

	// Instantiate the Unit Under Test (UUT)
	Maquina_Escritura uut (
		.clk(clk), 
		.reset(reset), 
		.Escritura(Escritura), 
		.Seg(Seg), 
		.Min(Min), 
		.Hora(Hora), 
		.Ano(Ano), 
		.Mes(Mes), 
		.Dia(Dia), 
		.CS(CS), 
		.WR(WR), 
		.RD(RD), 
		.AD(AD), 
		.Term_Esc(Term_Esc),
		.Dato_Dire(Dato_Dire)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		Escritura = 0;
		Seg = 0;
		Min = 34;
		Hora = 3;
		Ano = 2016;
		Mes = 09;
		Dia = 08;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1;
		#100;
		reset = 0;
		#100;
		Escritura = 1;
		#2000
		Escritura = 0;
        
		// Add stimulus here

	end
     always  begin
		#5	clk = ~clk;
		end  
endmodule

