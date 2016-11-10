`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:54:01 10/28/2016 
// Design Name: 
// Module Name:    pico_top 
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
module pico_top( input wire clk, input cpu_reset, input wire [7:0] in_port,
	output wire  k_write_strobe, interrupt_ack,output wire write_strobe, read_strobe,output wire [7:0]port_id, out_port,
    output wire[17:0] instruccion
	 );

wire	[11:0]	address;
wire	[17:0]	instruction;
wire			bram_enable;
//wire	[7:0]		port_id;
//wire	[7:0]		out_port;
//wire			write_strobe;
//wire			read_strobe;
wire			kcpsm6_sleep;         //See note above
wire			kcpsm6_reset;   
	//
//wire [7:0] out_prt, prt_id;
//wire wr_strb, rd_strb;
//wire [11:0] addressI;
//wire [17:0] instructionI;
/*reg wr_reg,wr_next,rd_reg,rd_next;
reg [7:0] id_next,id_reg,out_reg,out_next;
always @(posedge clk, posedge cpu_reset)   // Maquina de estados y registro dtos
	if (cpu_reset)begin
		wr_reg <= 0;
		rd_reg <= 0;
		id_reg <= 0;	
		out_reg <= 0;
		
		end
	else begin
		wr_reg <= wr_next;
		rd_reg <= rd_next;
		id_reg <= id_next;	
		out_reg <= out_next;		end
// Instanciar el KCPSM6
always@* begin
wr_next = write_strobe;
rd_next = read_strobe;
id_next = port_id;
out_next = out_port;
end*/
  kcpsm6 #(
	.interrupt_vector	(12'h3FF),
	.scratch_pad_memory_size(64),
	.hwbuild		(8'h00))
  processor (
	.address 		(address),
	.instruction 	(instruction),
	.bram_enable 	(bram_enable),
	.port_id 		(port_id),
	.write_strobe 	(write_strobe),
	.k_write_strobe 	(k_write_strobe),
	.out_port 		(out_port),
	.read_strobe 	(read_strobe),
	.in_port 		(in_port),
	.interrupt 		(interrupt),
	.interrupt_ack 	(interrupt_ack),
	.reset 		(kcpsm6_reset),
	.sleep		(kcpsm6_sleep),
	.clk 			(clk)); 

assign kcpsm6_sleep = 1'b0;
assign interrupt = 1'b0;

// Instanciar rom de instrucciones// Instantiate the module


  prueba1 #(
	.C_FAMILY		   ("7S"),   	//Family 'S6' or 'V6'
	.C_RAM_SIZE_KWORDS	(2),     	//Program size '1', '2' or '4'
	.C_JTAG_LOADER_ENABLE	(1))     	//Include JTAG Loader when set to 1'b1 
  program_rom (    		       	//Name to match your PSM file
 	.rdl 			(rdl),
	.enable 		(bram_enable),
	.address 		(address),
	.instruction 	(instruction),
	.clk 			(clk));

assign kcpsm6_reset = cpu_reset | rdl;
assign instruccion = instruction;

endmodule 