`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:46:53 10/24/2016 
// Design Name: 
// Module Name:    deco 
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
module deco(
input wire clk,reset,	
input wire [7:0] dato_pico, 
input [3:0] port_id,
input write_St,

output wire [7:0] seg_VGA, min_VGA, hora_VGA, dia_VGA, mes_VGA, ano_VGA,  // salidas que van para el modulo de VGA
seg_T_VGA, min_T_VGA, hora_T_VGA	
    );
	 
reg [7:0] seg_VGA_reg, min_VGA_reg, hora_VGA_reg, dia_VGA_reg, mes_VGA_reg, ano_VGA_reg,
seg_T_VGA_reg, min_T_VGA_reg, hora_T_VGA_reg;	
reg [7:0] seg_VGA_next, min_VGA_next, hora_VGA_next, dia_VGA_next, mes_VGA_next, ano_VGA_next,
seg_T_VGA_next, min_T_VGA_next, hora_T_VGA_next;	



always @(posedge clk, posedge reset) begin
 
	if (reset) begin
		seg_VGA_reg <= 7'b0;
		min_VGA_reg <= 7'b0;
		hora_VGA_reg <= 7'b0;
		dia_VGA_reg <= 7'b0;
		mes_VGA_reg <= 7'b0;
		ano_VGA_reg <= 7'b0;
		seg_T_VGA_reg <= 7'b0;
		min_T_VGA_reg <= 7'b0;
		hora_T_VGA_reg <= 7'b0;
		end
	else begin
		seg_VGA_reg <= seg_VGA_next;
		min_VGA_reg <= min_VGA_next;
		hora_VGA_reg <= hora_VGA_next;
		dia_VGA_reg <= dia_VGA_next;
		mes_VGA_reg <= mes_VGA_next;
		ano_VGA_reg <= ano_VGA_next;
		seg_T_VGA_reg <= seg_T_VGA_next;
		min_T_VGA_reg <= min_T_VGA_next;
		hora_T_VGA_reg <= hora_T_VGA_next;
		end
	end	
		
always @* begin	
		seg_VGA_next = seg_VGA_reg;
		min_VGA_next = min_VGA_reg;
		hora_VGA_next = hora_VGA_reg;
		dia_VGA_next = dia_VGA_reg;
		mes_VGA_next = mes_VGA_reg;
		ano_VGA_next = ano_VGA_reg;
		seg_T_VGA_next = seg_T_VGA_reg;
		min_T_VGA_next = min_T_VGA_reg;
		hora_T_VGA_next = hora_T_VGA_reg;
		
	
	if (write_St== 1 && port_id == 4'b0001)
		seg_VGA_next = dato_pico;
	else if (write_St==1 && port_id == 4'b0010)
		min_VGA_next = dato_pico;
	else if (write_St==1 && port_id == 4'b0011)
		hora_VGA_next = dato_pico;
	else if (write_St==1 && port_id == 4'b0111)
		dia_VGA_next = dato_pico;
	else if (write_St==1 && port_id == 4'b1000)
		mes_VGA_next = dato_pico;
	else if (write_St==1 && port_id == 4'b1001)
		ano_VGA_next = dato_pico;
	else if (write_St==1 && port_id == 4'b0100)
		seg_T_VGA_next = dato_pico;
	else if (write_St==1 && port_id == 4'b0101)
		min_T_VGA_next = dato_pico;
	else if (write_St==1 && port_id == 4'b0110)
		hora_T_VGA_next = dato_pico;
		
		
	else begin
		seg_VGA_next = seg_VGA_reg;
		min_VGA_next = min_VGA_reg;
		hora_VGA_next = hora_VGA_reg;
		dia_VGA_next = dia_VGA_reg;
		mes_VGA_next = mes_VGA_reg;
		ano_VGA_next = ano_VGA_reg;
		seg_T_VGA_next = seg_T_VGA_reg;
		min_T_VGA_next = min_T_VGA_reg;
		hora_T_VGA_next = hora_T_VGA_reg;
		
		end end
		
	assign seg_VGA = seg_VGA_reg;
	assign min_VGA = min_VGA_reg;
	assign hora_VGA = hora_VGA_reg;
	assign dia_VGA = dia_VGA_reg;
	assign mes_VGA = mes_VGA_reg;
	assign ano_VGA = ano_VGA_reg;
	assign seg_T_VGA = seg_T_VGA_reg;
	assign min_T_VGA = min_T_VGA_reg;
	assign hora_T_VGA = hora_T_VGA_reg;
	
endmodule
