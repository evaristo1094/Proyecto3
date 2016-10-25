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
	reg derecha;
	reg apagar_alarma;
	reg izquierda;
	reg aumenta;
	reg disminuya;
	reg configuracion;
	reg sw_Clk_timer;
	reg boton_doce_24;
	reg sw_escribir;
	reg sw_inicializador;

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
		.derecha(derecha), 
		.apagar_alarma(apagar_alarma), 
		.izquierda(izquierda), 
		.aumenta(aumenta), 
		.disminuya(disminuya), 
		.configuracion(configuracion), 
		.sw_Clk_timer(sw_Clk_timer), 
		.boton_doce_24(boton_doce_24), 
		.sw_escribir(sw_escribir), 
		.sw_inicializador(sw_inicializador), 
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
		derecha = 0;
		apagar_alarma = 0;
		izquierda = 0;
		aumenta = 0;
		disminuya = 0;
		configuracion = 0;
		sw_Clk_timer = 0;
		boton_doce_24 = 0;
		sw_escribir = 0;
		sw_inicializador = 0;

		// Wait 100 ns for global reset to finish
		#20;
		reset = 1;
      #20;
		reset = 0;
		#2000;
		sw_inicializador = 1;
		#10
		sw_inicializador = 0;
		#6050;
		sw_Clk_timer = 1;
		sw_escribir = 1;
		#10;
		sw_Clk_timer = 1;
		sw_escribir = 0;
		#10;
		sw_escribir = 0;
		// Add stimulus here

	end
     always  begin
			#5	clk = ~clk;
		end
endmodule

