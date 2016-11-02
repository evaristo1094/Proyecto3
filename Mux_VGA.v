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
module Mux_VGA( input En_Escr,En_clock,
input wire [7:0] seg_usu, min_usu, hora_usu, dia_usu, mes_usu, ano_usu, // datos que vienen del modulo de luis
seg_T_usu, min_T_usu, hora_T_usu, 			// datos que vienen del modulo de luis
seg_RTC, min_RTC, hora_RTC, dia_RTC, mes_RTC, ano_RTC,	// datos que vienen del modulo de lectura
seg_T_RTC, min_T_RTC, hora_T_RTC, 		// datos que vienen del modulo de lectura
output reg [7:0] seg_VGAY, min_VGAY, hora_VGAY, dia_VGAY, mes_VGAY, ano_VGAY,  // salidas que van apara el modulo de VGA
seg_T_VGAY, min_T_VGAY, hora_T_VGAY				// salidas que van apara el modulo de VGA
    );

always@* 

//// Si se esta escribiendo y esta ingresando los datos del reloj ////
		if (En_Escr && En_clock) begin
		/// datos ingresados por el usuario////
			seg_VGAY = seg_usu; 
			min_VGAY = min_usu;
			hora_VGAY = hora_usu;
			dia_VGAY = dia_usu;
			mes_VGAY = mes_usu;
			ano_VGAY = ano_usu;
		/// Datos de la maquina de lectura	 ////
			seg_T_VGAY = seg_T_RTC;
			min_T_VGAY = min_T_RTC;
			hora_T_VGAY =  hora_T_RTC;
				end
//// Si se esta escribiendo y esta ingresando los datos del timer ////				
		else if (En_Escr && ~En_clock) begin
		/// Datos de la maquina de lectura	 ////
			seg_VGAY = seg_RTC; 
			min_VGAY = min_RTC;
			hora_VGAY = hora_RTC;
			dia_VGAY = dia_RTC;
			mes_VGAY = mes_RTC;
			ano_VGAY = ano_RTC;
		/// datos ingresados por el usuario////
			seg_T_VGAY = seg_T_usu;
			min_T_VGAY = min_T_usu;
			hora_T_VGAY =  hora_T_usu;
			end
//// Si no se esta escribiendo, lee lo de la maquina de lectura ////				
		else  begin
			seg_VGAY = seg_RTC; 
			min_VGAY = min_RTC;
			hora_VGAY = hora_RTC;
			dia_VGAY = dia_RTC;
			mes_VGAY = mes_RTC;
			ano_VGAY = ano_RTC;
			seg_T_VGAY = seg_T_RTC;
			min_T_VGAY = min_T_RTC;
			hora_T_VGAY =  hora_T_RTC;
			end
				
endmodule

