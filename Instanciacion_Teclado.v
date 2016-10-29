`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:15:59 10/21/2016 
// Design Name: 
// Module Name:    Instanciacion_Teclado 
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
module Instanciacion_Teclado(input wire clk, reset, read_strobe, wrt_strobe,ps2d, ps2c, input wire [7:0]port_id,tecla, 
output wire f1, f2, f3, f4,f5,f12,up,down,left,right,output wire [7:0]dato
    );
wire rx_done_tick, write, configurate, inicializate, arriba, abajo, izquierda, derecha, off_alarma, T24_12, clock_timer;
wire[7:0] dout;
 
Receptor_PS2 instance_name (
    .clk(clk), 
    .reset(reset), 
    .ps2d(ps2d), 
    .ps2c(ps2c), 
    .rx_en(1'b1), 
    .rx_done_tick(rx_done_tick), 
    .dout(dout)
    );
codigo_teclas instance_name2 (
    .clk(clk), 
    .reset(reset), 
    .scan_done_tick(rx_done_tick), 
    .scan_out(dout), 
    .got_code_tick(), 
	 .read_strobe(read_strobe),
	 .port_id(port_id),
    .dato(dato)
    );
Deco_Teclado instance_name3 (
    .clk(clk), 
    .reset(reset), 
    .wrt_strobe(wrt_strobe), 
    .port_ID(port_id), 
    .tecla(tecla), 
    .write(write), 
    .configurate(configurate), 
    .inicializate(inicializate), 
    .arriba(arriba), 
    .abajo(abajo), 
    .izquierda(izquierda), 
    .derecha(derecha), 
    .off_alarma(off_alarma), 
    .T24_12(T24_12), 
    .clock_timer(clock_timer)
    );
assign f1 = configurate;
assign f2 = clock_timer;
assign f3 = T24_12;
assign f4 = write;
assign f5 = off_alarma;
assign f12 = inicializate;
assign up = arriba;
assign down = abajo;
assign left = izquierda;
assign right = derecha;

endmodule
