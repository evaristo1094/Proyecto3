`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:22 10/24/2016 
// Design Name: 
// Module Name:    Deco_Teclado 
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
module Deco_Teclado(
input wire clk, reset, wrt_strobe,
input wire [7:0] port_ID, tecla,
output reg write,configurate,inicializate,arriba,abajo,izquierda,derecha,off_alarma,
output wire T24_12,clock_timer 
);
   
localparam F1 = 8'h05;    //  Configuracion
localparam F2 = 8'h06;    //  Clock/timer
localparam F3 = 8'h04;    //  12/24
localparam F4 = 8'h0c;    //  Escribir
localparam F5 = 8'h03;    //  Alarma/OFF
localparam F12 = 8'h07;    //  Inicializa
localparam f_arriba = 8'h75;    //  flecha arriba
localparam f_abajo = 8'h72;    //  flecha abajo
localparam f_izq = 8'h6b;		//flecha izquierda
localparam f_der = 8'h74;		// flecha derecha
localparam wait_WRSTB = 1'b0;  // declaracion simbolica de estados 
localparam deco = 1'b1;  
localparam Teclado = 8'h0a;
reg state_next, state_reg;       // declaracion de señales 	
reg T24_12_reg,T24_12_next,clock_timer_reg,clock_timer_next;
	always @(posedge clk, posedge reset)   // Maquina de estados y registro dtos
	if (reset)begin
		state_reg <= wait_WRSTB;
		T24_12_reg <= 0;
		clock_timer_reg <= 0;		end
	else begin
		state_reg <= state_next;
		T24_12_reg <= T24_12_next;
		clock_timer_reg <= clock_timer_next;		end
always @*
begin
	write = 1'b0;
	configurate = 1'b0;
	inicializate = 1'b0;
	clock_timer_next = clock_timer_reg;
	T24_12_next = T24_12_reg;
	arriba = 1'b0;
	abajo = 1'b0;
	izquierda = 1'b0;
	derecha = 1'b0;
	off_alarma = 1'b0;
case (state_reg)
		wait_WRSTB:   
			if (port_ID == Teclado) 
				state_next = deco;
			else 	state_next = wait_WRSTB;
		deco:	
			if (wrt_strobe == 1'b1 && tecla == F1) begin
				configurate = 1'b1;
				state_next = wait_WRSTB;end
			else if (wrt_strobe == 1'b1 && tecla == F2) begin
				clock_timer_next = ~clock_timer_reg;
				state_next = wait_WRSTB;end
			else if (wrt_strobe == 1'b1 && tecla == F3)begin
				T24_12_next = ~T24_12_reg;
				state_next = wait_WRSTB;end
			else if (wrt_strobe == 1'b1 && tecla == F4) begin
				write = 1'b1;
				state_next = wait_WRSTB;end
			else if (wrt_strobe == 1'b1 && tecla == F5) begin
				off_alarma = 1'b1;	
				state_next = wait_WRSTB;end
			else if (wrt_strobe == 1'b1 && tecla == F12) begin
				inicializate = 1'b1;
				state_next = wait_WRSTB;end
			else if (wrt_strobe == 1'b1 && tecla == f_arriba)begin
				arriba = 1'b1;	
				state_next = wait_WRSTB;end
			else if (wrt_strobe == 1'b1 && tecla == f_abajo)begin
				abajo = 1'b1;
				state_next = wait_WRSTB;end
			else if (wrt_strobe == 1'b1 && tecla == f_der)begin
				derecha = 1'b1;
				state_next = wait_WRSTB;end
			else if (wrt_strobe == 1'b1 && tecla == f_izq)begin
				izquierda = 1'b1;
				state_next = wait_WRSTB;end
			else 
				state_next = deco;
	endcase			
end
assign T24_12 = T24_12_reg;
assign clock_timer = clock_timer_reg;
endmodule
