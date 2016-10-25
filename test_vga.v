`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:40:48 10/22/2016
// Design Name:   instanciacion_vga_2
// Module Name:   C:/Users/Evaristo/Documents/Verilog/Proyecto2/test_vga.v
// Project Name:  Proyecto2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instanciacion_vga_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_vga;

	// Inputs
	reg CLK_TB;
	reg RESET_TB;
	reg activring_TB;
	reg bandera_TB_hh;
	reg bandera_TB_mh;
	reg bandera_TB_sh;
	reg bandera_TB_df;
	reg bandera_TB_mf;
	reg bandera_TB_af;
	reg bandera_TB_hc;
	reg bandera_TB_mc;
	reg bandera_TB_sc;
	reg [7:0] hora;
	reg [7:0] min;
	reg [7:0] seg;
	reg [7:0] dia;
	reg [7:0] mes;
	reg [7:0] ano;
	reg [7:0] c_hora;
	reg [7:0] c_min;
	reg [7:0] c_seg;
	
	// Outputs
	wire v_sync;
	wire h_sync;
	wire [6:0] text_on_out;
	wire [2:0] text_rgb_out;
	wire [9:0] pix_X;
	wire videon;
	// Instantiate the Unit Under Test (UUT)
	instanciacion_vga_2 uut (
		.CLK_TB(CLK_TB), 
		.RESET_TB(RESET_TB), 
		.activring_TB(activring_TB), 
		.bandera_TB_hh(bandera_TB_hh), 
		.bandera_TB_mh(bandera_TB_mh), 
		.bandera_TB_sh(bandera_TB_sh), 
		.bandera_TB_df(bandera_TB_df), 
		.bandera_TB_mf(bandera_TB_mf), 
		.bandera_TB_af(bandera_TB_af), 
		.bandera_TB_hc(bandera_TB_hc), 
		.bandera_TB_mc(bandera_TB_mc), 
		.bandera_TB_sc(bandera_TB_sc), 
		.hora(hora), 
		.min(min), 
		.seg(seg), 
		.dia(dia), 
		.mes(mes), 
		.ano(ano), 
		.c_hora(c_hora), 
		.c_min(c_min), 
		.c_seg(c_seg), 
		.v_sync(v_sync), 
		.h_sync(h_sync), 
		.text_on_out(text_on_out), 
		.text_rgb_out(text_rgb_out),
		.pix_X(pix_X),
		.videon(videon)
	);

		integer i;
		integer j;

		always #5 CLK_TB=~CLK_TB;
		initial begin
		// Initialize Inputs
		CLK_TB = 0;
		RESET_TB = 1;
		activring_TB = 0;
		bandera_TB_hh = 1;
		bandera_TB_mh = 1;
		bandera_TB_sh = 1;
		bandera_TB_df = 1;
		bandera_TB_mf = 1;
		bandera_TB_af = 1;
		bandera_TB_hc = 1;
		bandera_TB_mc = 1;
		bandera_TB_sc = 1;
		hora = 8'b00010010;
		min = 8'b00010010;
		seg = 8'b00010010;
		dia = 8'b00010010;
		mes = 8'b00010010;
		ano = 8'b00010010;
		c_hora = 8'b00010010;
		c_min = 8'b00010010;
		c_seg = 8'b00010010;

		// Wait 100 ns for global reset to finish
		j=0;
		 #50
		 RESET_TB = 0;

		 //archivo txt para observar los bits, simulando una pantalla
		 
		 i = $fopen("VGA.txt","w");
		 for(j=0;j<383520;j=j+1) begin
			#40
			if(videon) begin
			  $fwrite(i,"%h",text_rgb_out);
			end
			else if(pix_X==641)
			  $fwrite(i,"\n");
			 
		 end


		 #16800000
		 RESET_TB = 0;
		 $fclose(i);
		 $stop;

	end
      
endmodule

