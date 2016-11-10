`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:57:40 09/26/2016 
// Design Name: 
// Module Name:    Inst_Mux_Usuario 
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
module Inst_Mux_Usuario( input wire btn_dism, btn_aum, btn_der, btn_izq,btn_RESET,CLK,switch_configuracion,apagar_alarma,
switch_Clk_timer,boton_doce_24,sw_escribir,sw_inicializador, input wire [7:0] dato_teclado,
output wire curs_seg,curs_min,curs_hora,curs_dia,curs_mes,curs_ano,rd_strobe,wr_strobe,
curs_T_seg,curs_T_min,curs_T_hora, WRO,RDO,CSO,ADO,activring,output reg sonido,
output wire [7:0] s_VGA, mi_VGA,h_VGA, d_VGA, me_VGA,an_VGA,s_T_VGA,m_T_VGA,h_T_VGA,puerto_id,out_puerto,
inout wire [7:0] Bus_Dato_Dir
    );
	 
wire [7:0] seg_C,min_C,hora_C,dia,mes,ano,segundo,minuto,hora,hora_TVGA,seg_TVGA,min_TVGA; 
wire [7:0] Seg2,Min2,Hora2,Dia2,Mes2,Ano2,Seg2_T,Min2_T,Hora2_T,seg_T,min_T,hora_T;
wire [3:0] hora_1,hora_2,min_1,min_2,seg_1,seg_2; 
wire cursor_seg,cursor_min,cursor_hora,cursor_dia,cursor_mes,cursor_ano,dta,
cursor_T_seg,cursor_T_min,cursor_T_hora,crono,configurate;     
wire [7:0] seg_VGA,min_VGA,hora_VGA,dia_VGA,mes_VGA,ano_VGA,seg_T_VGA,min_T_VGA,hora_T_VGA;
wire [7:0] seg_VGAY,min_VGAY,hora_VGAY,dia_VGAY,mes_VGAY,ano_VGAY,seg_T_VGAY,min_T_VGAY,hora_T_VGAY;
wire read_strobe,write_strobe;
wire [7:0] port_id,out_port,pico_in_port;
Mux_VGA instance_name1 (
    .En_Escr(switch_configuracion), 
    .En_clock(switch_Clk_timer), 
    .seg_usu(seg_C), 
    .min_usu(min_C), 
    .hora_usu(hora_C), 
    .dia_usu(dia), 
    .mes_usu(mes), 
    .ano_usu(ano), 
    .seg_T_usu(seg_TVGA), 
    .min_T_usu(min_TVGA), 
    .hora_T_usu(hora_TVGA), 
    .seg_RTC(seg_VGA), 
    .min_RTC(min_VGA), 
    .hora_RTC(hora_VGA), 
    .dia_RTC(dia_VGA), 
    .mes_RTC(mes_VGA), 
    .ano_RTC(ano_VGA), 
    .seg_T_RTC(seg_T_VGA), 
    .min_T_RTC(min_T_VGA), 
    .hora_T_RTC(hora_T_VGA), 
    .seg_VGAY(seg_VGAY), 
    .min_VGAY(min_VGAY), 
    .hora_VGAY(hora_VGAY), 
    .dia_VGAY(dia_VGAY), 
    .mes_VGAY(mes_VGAY), 
    .ano_VGAY(ano_VGAY), 
    .seg_T_VGAY(seg_T_VGAY), 
    .min_T_VGAY(min_T_VGAY), 
    .hora_T_VGAY(hora_T_VGAY)
    );

Ingreso_Datos instance_name2 (
    .clk(CLK), 
    .reset(btn_RESET), 
    .C_T(switch_Clk_timer), 
    .disminuye(btn_dism), 
    .aumenta(btn_aum), 
    .escribe(switch_configuracion), 
    .corre_der(btn_der), 
    .corre_izq(btn_izq), 
    .doce_24(boton_doce_24), 
    .seg_C(seg_C), 
    .min_C(min_C), 
    .hora_C(hora_C), 
    .dia(dia), 
    .mes(mes), 
    .ano(ano), 
    .seg_T(seg_T), 
    .min_T(min_T), 
    .hora_T(hora_T), 
    .cursor_seg(cursor_seg), 
    .cursor_min(cursor_min), 
    .cursor_hora(cursor_hora), 
    .cursor_mes(cursor_mes), 
    .cursor_dia(cursor_dia), 
    .cursor_ano(cursor_ano), 
    .cursor_T_seg(cursor_T_seg), 
    .cursor_T_min(cursor_T_min), 
    .cursor_T_hora(cursor_T_hora),
	 .hora_TVGA(hora_TVGA),
	 .seg_TVGA(seg_TVGA),
	 .min_TVGA(min_TVGA)
    );

Top_Instanciacion instance_name4 (
    .CLK(CLK), 
    .Reset(btn_RESET), 
    .WR1(sw_escribir), 
    .CT(switch_Clk_timer), 
    .doce_24(boton_doce_24), 
    .inicializar(sw_inicializador), 
    .clk_seg1(seg_C), 
    .clk_min1(min_C), 
    .clk_hora1(hora_C), 
    .Mes1(mes), 
    .Dia1(dia), 
    .Ano1(ano), 
    .Mes2(Mes2), 
    .Dia2(Dia2), 
    .Ano2(Ano2), 
    .Seg2(Seg2), 
    .Min2(Min2), 
    .Hora2(Hora2), 
    .Seg2_T(Seg2_T), 
    .Min2_T(Min2_T), 
    .Hora2_T(Hora2_T), 
    .WRO(WRO), 
    .CSO(CSO), 
    .ADO(ADO), 
    .RDO(RDO), 
    .Bus_Dato_Dir(Bus_Dato_Dir),
	 .alarma_ON(alarma_ON),
	 .T_seg(seg_T),
	 .T_min(min_T),
	 .T_hora(hora_T)
    );
indicador_ring instance_name5 (
    .alarma_on(alarma_ON), 
    .HRTC(Hora2_T), 
    .MRTC(Min2_T), 
    .SRTC(Seg2_T), 
    .activring(activring), 
    .hora_1(hora_1), 
    .hora_2(hora_2), 
    .min_1(min_1), 
    .min_2(min_2), 
    .seg_1(seg_1), 
    .seg_2(seg_2),
	 .clk(CLK),
	 .reset(btn_RESET),
	 .apagar_alarma(apagar_alarma)
    );
	 
deco instance_name6 (
    .clk(CLK), 
    .reset(btn_RESET), 
    .dato_pico(out_port), 
    .port_id(port_id), 
    .write_St(write_strobe), 
    .seg_VGA(seg_VGA), 
    .min_VGA(min_VGA), 
    .hora_VGA(hora_VGA), 
    .dia_VGA(dia_VGA), 
    .mes_VGA(mes_VGA), 
    .ano_VGA(ano_VGA), 
    .seg_T_VGA(seg_T_VGA), 
    .min_T_VGA(min_T_VGA), 
    .hora_T_VGA(hora_T_VGA)
    );	 
	
mux_picoblaze instance_name7 (
    .read_strobe(read_strobe), 
    .port_id(port_id), 
    .tecla(dato_teclado), 
    .dia(Dia2), 
    .mes(Mes2), 
    .ano(Ano2), 
    .hora(Hora2), 
    .min(Min2), 
    .seg(Seg2), 
    .chora(hora), 
    .cmin(minuto), 
    .cseg(segundo), 
    .pico_in_port(pico_in_port)
    );
	 
pico_top instance_name8 (
    .clk(CLK), 
    .cpu_reset(btn_RESET), 
    .in_port(pico_in_port), 
    .write_strobe(write_strobe), 
    .read_strobe(read_strobe), 
    .k_write_strobe(), 
    .interrupt_ack(), 
    .port_id(port_id), 
    .out_port(out_port)
    );	
Contador_17bits instance_name9 (
    .clk(CLK), 
    .dta(dta)
    );
always@* begin
	if(activring)
		sonido = dta;
	else 
		sonido = 0;
	end	
		
assign curs_seg = cursor_seg; 
assign curs_min = cursor_min;
assign curs_hora = cursor_hora; 
assign curs_mes = cursor_mes; 
assign curs_dia = cursor_dia;
assign curs_ano = cursor_ano; 
assign curs_T_seg = cursor_T_seg; 
assign curs_T_min = cursor_T_min; 
assign curs_T_hora = cursor_T_hora;
assign s_VGA = seg_VGAY;
assign mi_VGA = min_VGAY;
assign h_VGA = hora_VGAY;
assign d_VGA = dia_VGAY;
assign me_VGA = mes_VGAY;
assign an_VGA = ano_VGAY;
assign s_T_VGA = seg_T_VGAY;
assign m_T_VGA = min_T_VGAY;
assign h_T_VGA = hora_T_VGAY;
assign segundo = {seg_1,seg_2};
assign minuto = {min_1,min_2};
assign hora = {hora_1,hora_2};
assign wr_strobe = write_strobe;
assign rd_strobe = read_strobe;
assign out_puerto = out_port;
assign puerto_id = port_id;
//assign sonido = dta;
endmodule
