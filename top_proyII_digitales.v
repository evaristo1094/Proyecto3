`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:58:16 09/26/2016 
// Design Name: 
// Module Name:    top_proyII_digitales 
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
module top_proyII_digitales(input wire clk, reset,  ps2d,ps2c,
output wire [6:0] text_on_out,
output wire [2:0] text_RGB_out,
output wire h_sync, v_sync,
output wire CSO,WRO,RDO,ADO,wr,
inout wire [7:0]Bus_Dato_Dire
    );
	 
wire curs_seg, curs_min, curs_hora, curs_dia, curs_mes, curs_ano, curs_T_seg, curs_T_min, curs_T_hora;
wire [7:0] s_VGA, mi_VGA, h_VGA, d_VGA, me_VGA, an_VGA, s_T_VGA, m_T_VGA, h_T_VGA;
wire [7:0] Bus_Dato_Dir;
wire activring;
wire f1,f2,f3,f4,f5,f12,up,down,left,right,rd_strobe,wr_strobe;
wire [7:0] dato,puerto_id,out_puerto;
// Instantiate the module

Instanciacion_Teclado instance_name5 (
    .clk(clk), 
    .reset(reset), 
    .read_strobe(rd_strobe), 	//pico
    .wrt_strobe(wr_strobe), 		//pico
    .ps2d(ps2d), 						
    .ps2c(ps2c), 
    .port_id(puerto_id), 				//pico
    .tecla(out_puerto), 					//pico
    .f1(f1), 
    .f2(f2), 
    .f3(f3), 
    .f4(f4), 
    .f5(f5), 
    .f12(f12), 
    .up(up), 
    .down(down), 
    .left(left), 
    .right(right), 
    .dato(dato)						//pico
    );
	 
Inst_Mux_Usuario instance_name4 (
    .btn_dism(down), 
    .btn_aum(up), 
    .btn_der(right), 
    .btn_izq(left), 
    .btn_RESET(reset), 
    .CLK(clk), 
	 .sw_inicializador(f12),
    .switch_configuracion(f1), 
    .switch_Clk_timer(f2), 
    .boton_doce_24(f3), 
    .sw_escribir(f4), 
    .curs_seg(curs_seg), 
    .curs_min(curs_min), 
    .curs_hora(curs_hora), 
    .curs_dia(curs_dia), 
    .curs_mes(curs_mes), 
    .curs_ano(curs_ano), 
    .curs_T_seg(curs_T_seg), 
    .curs_T_min(curs_T_min), 
    .curs_T_hora(curs_T_hora), 
    .s_VGA(s_VGA), 
    .mi_VGA(mi_VGA), 
    .h_VGA(h_VGA), 
    .d_VGA(d_VGA), 
    .me_VGA(me_VGA), 
    .an_VGA(an_VGA), 
    .s_T_VGA(s_T_VGA), 
    .m_T_VGA(m_T_VGA), 
    .h_T_VGA(h_T_VGA),
	 .WRO(WRO), 
    .RDO(RDO), 
    .CSO(CSO), 
    .ADO(ADO),
	 .Bus_Dato_Dir(Bus_Dato_Dir),
	 .activring(activring),
	 .apagar_alarma(f5),
	 .dato_teclado(dato),
	 .puerto_id(puerto_id),
	 .out_puerto(out_puerto),
	 .wr_strobe(wr_strobe),
	 .rd_strobe(rd_strobe)
    );

// Instantiate the module
instanciacion_vga_2 instance_name2 (
    .CLK_TB(clk), 
    .RESET_TB(reset), 
    .activring_TB(activring), 
    .bandera_TB_hh(curs_hora), 
    .bandera_TB_mh(curs_min), 
    .bandera_TB_sh(curs_seg), 
    .bandera_TB_df(curs_dia), 
    .bandera_TB_mf(curs_mes), 
    .bandera_TB_af(curs_ano), 
    .bandera_TB_hc(curs_T_hora), 
    .bandera_TB_mc(curs_T_min), 
    .bandera_TB_sc(curs_T_seg), 
    .hora(h_VGA), 
    .min(mi_VGA), 
    .seg(s_VGA), 
    .dia(d_VGA), 
    .mes(me_VGA), 
    .ano(an_VGA), 
    .c_hora(h_T_VGA), 
    .c_min(m_T_VGA), 
    .c_seg(s_T_VGA), 
    .v_sync(v_sync), 
    .h_sync(h_sync), 
    .text_on_out(text_on_out), 
    .text_rgb_out(text_RGB_out),
	 .formato_12(f3),
	 .pix_X(),
	 .videon()
    );

assign Bus_Dato_Dire = Bus_Dato_Dir ; 


endmodule
