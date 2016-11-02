`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:16:23 10/26/2016 
// Design Name: 
// Module Name:    mux_picoblaze 
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
module mux_picoblaze(input wire read_strobe,  input wire [7:0] port_id, tecla, dia, mes, ano, hora, min, seg, chora, cmin, cseg, 
	output reg [7:0] pico_in_port
    );
	 
always @*
	begin 
		if(read_strobe==1)
			begin case (port_id)
			8'h01: pico_in_port = seg;
			8'h02: pico_in_port = min;
			8'h03: pico_in_port = hora;
			8'h04: pico_in_port = cseg;
			8'h05: pico_in_port = cmin;
			8'h06: pico_in_port = chora;
			8'h07: pico_in_port = dia;
			8'h08: pico_in_port = mes;
			8'h09: pico_in_port = ano;
			8'h0a: pico_in_port = tecla;
			default: pico_in_port = tecla;  
			endcase
		end
		else 
		  pico_in_port = tecla;
	end
endmodule
