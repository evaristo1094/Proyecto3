`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:19 09/24/2016 
// Design Name: 
// Module Name:    Mux_VGA 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Mux_VGA( input wire En_Escr, //senal que indica que esta en modo de configuracion
En_clock, // senal que indica que esta modificando, 0 timer, 1 clk
clk,reset,
input wire [7:0] seg_usu, min_usu, hora_usu, dia_usu, mes_usu, ano_usu, // datos que vienen del modulo de luis
seg_T_usu, min_T_usu, hora_T_usu, 			// datos que vienen del modulo de luis
seg_RTC, min_RTC, hora_RTC, dia_RTC, mes_RTC, ano_RTC,	// datos que vienen del modulo de lectura
seg_T_RTC, min_T_RTC, hora_T_RTC, 		// datos que vienen del modulo de lectura
output reg [7:0] seg_VGA, min_VGA, hora_VGA, dia_VGA, mes_VGA, ano_VGA,  // salidas que van apara el modulo de VGA
seg_T_VGA, min_T_VGA, hora_T_VGA,				// salidas que van apara el modulo de VGA
output reg configurate, crono // salidas para saber que se esta realizando. crono = 1 timer, crono = 0 clk.
    );

localparam [1:0]	s0 = 2'b00,
						s1 = 2'b01,
						s2 = 2'b10,
						s3 = 2'b11;
						 
reg [1:0] state_next, state_reg;   				
always @(posedge clk, posedge reset)begin   // Maquina de estados y registro dtos
	if (reset)
		state_reg <= s0;
	else 
		state_reg <= state_next;

end

always@* begin
	state_next = 0;
	seg_VGA = 0;
	min_VGA = 0;
	hora_VGA = 0;
	dia_VGA = 0;
	mes_VGA = 0; 
	ano_VGA = 0;
	seg_T_VGA = 0; 
	min_T_VGA = 0;
	hora_T_VGA = 0;
	configurate = 0;
	crono = 0;	
	case(state_reg)
//// Estado general, lee los datos de la maquina de lectura////
		s0: if (En_Escr)
				state_next = s1; // cambia de estado si esta configurando
			else begin
			//// Si no se esta configurando, lee lo de la maquina de lectura ////				
			seg_VGA = seg_RTC; 
			min_VGA = min_RTC;
			hora_VGA = hora_RTC;
			dia_VGA = dia_RTC;
			mes_VGA = mes_RTC;
			ano_VGA = ano_RTC;
			seg_T_VGA = seg_T_RTC;
			min_T_VGA = min_T_RTC;
			hora_T_VGA =  hora_T_RTC;
			configurate = 0;
			crono = 0;
			state_next = s0;
			end
/// Estado 2, determina si esta configurando clk o timer				
		s1: if (En_clock) 
				state_next = s2;
			else 
				state_next = s3;
/// Estado que lee los datos cuando esta configurando el clk		
		s2:		
			if (En_Escr)
				state_next = s0;
			else if (En_clock)
				state_next = s3;		
			else	begin
		/// datos ingresados por el usuario////
			seg_VGA = seg_usu; 
			min_VGA = min_usu;
			hora_VGA = hora_usu;
			dia_VGA = dia_usu;
			mes_VGA = mes_usu;
			ano_VGA = ano_usu;
		/// Datos de la maquina de lectura	 ////
			seg_T_VGA = seg_T_RTC;
			min_T_VGA = min_T_RTC;
			hora_T_VGA =  hora_T_RTC;
			configurate = 1;
			crono = 0;
			state_next = s2;
				end
/// Estado que lee los datos cuando esta configurando el timer					
		s3: 
			if (En_Escr)
				state_next = s0;
			else if (En_clock)
				state_next = s2;	
			else begin
		/// Datos de la maquina de lectura	 ////
			seg_VGA = seg_RTC; 
			min_VGA = min_RTC;
			hora_VGA = hora_RTC;
			dia_VGA = dia_RTC;
			mes_VGA = mes_RTC;
			ano_VGA = ano_RTC;
		/// datos ingresados por el usuario////
			seg_T_VGA = seg_T_usu;
			min_T_VGA = min_T_usu;
			hora_T_VGA =  hora_T_usu;
			configurate = 1;
			crono = 1;
			state_next = s3;
			end
		default: state_next = s0;	
		endcase
	end			
endmodule
