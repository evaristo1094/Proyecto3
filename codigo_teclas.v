`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:28:39 10/20/2016 
// Design Name: 
// Module Name:    codigo_teclas 
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

//maquinda de estados identifica con "break code" F0, y obtiene el codigo de la tecla


module codigo_teclas(
   
input wire clk, reset, scan_done_tick, read_strobe,
input wire [7:0] scan_out, port_id,
output reg got_code_tick,                     //actualiza la memoria inmediata FIFO (bandera)
output wire [7:0] dato
);


localparam BRK = 8'hF0;    //  breakcode // Declaracion de constantes
localparam wait_brk = 1'b0;  // declaracion simbolica de estados 
localparam get_code = 1'b1;  

reg state_next, state_reg;       // declaracion de señales 
reg [7:0]dato_next, dato_reg;

always @(posedge clk, posedge reset)   // Maquina de estados y registro dtos
	if (reset) begin
		state_reg <= wait_brk;
		dato_reg <= 8'b0;
		end
	else begin
		state_reg <= state_next;
		dato_reg <= dato_next; 
		end
always @*
begin
	got_code_tick = 1'b0;
	state_next = state_reg;
	dato_next = 8'b0;
	case (state_reg)
		wait_brk:       // Espera F0 de break code
			if (scan_done_tick == 1'b1 && scan_out == BRK) 
				state_next = get_code;
			else 	state_next = wait_brk;
		get_code:  //  código siguiente
			if (scan_done_tick) 
				begin
					got_code_tick =1'b1;
					dato_next = scan_out;
					state_next = get_code;
				end
			else if (port_id == 8'h0a  && read_strobe == 1'b1)
				state_next = wait_brk;	
			else begin
			state_next = state_reg;
			dato_next = dato_reg;
			end
			
			
	
	
	endcase
end
	assign dato = dato_reg;
	
endmodule


