`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:29:02 09/15/2016 
// Design Name: 
// Module Name:    vga_interfaz 
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
module vga_interfaz (
    input wire clk, activring, bandera_Hhora, bandera_Mhora, bandera_Shora, bandera_Dfecha, bandera_Mfecha, video_on,
	 input wire bandera_Afecha, bandera_Hcrono, bandera_Mcrono, bandera_Scrono, formato_12,
    input wire [3:0] hora1, hora2, min1, 
	 input wire [3:0] min2, sec1, sec2, 
	 input wire [3:0] dia1, dia2, mes1,
	 input wire [3:0] mes2, ano1, ano2, 
	 input wire [3:0] ch1, ch2, cm1,
    input wire [3:0]	cs1, cs2, cm2,
    input wire [9:0] pix_x, pix_y,
    output wire [6:0] text_on,
    output reg [2:0] text_rgb
    );
   // signal declaration
   wire [10:0] rom_addr;
   reg [6:0] char_addr, char_addr_h, char_addr_Th, char_addr_f, char_addr_Tf, char_addr_c, 
					char_addr_Tc, char_addr_r, char_addr_ampm,char_f1,char_f2,char_f3,char_f4,
					char_f12,char_ent,char_arriba,char_abajo,char_lados;
   reg [3:0] row_addr;
   wire [3:0] row_addr_h, row_addr_Th, row_addr_f, row_addr_Tf, row_addr_c, row_addr_Tc, 
					row_addr_r, row_addr_ampm,row_f1,row_f2,row_f3,row_f4,row_f12,row_ent
					,row_arriba,row_abajo,row_lados;
   reg [2:0] bit_addr;
   wire [2:0] bit_addr_h, bit_addr_Th,bit_addr_f, bit_addr_Tf, bit_addr_c, bit_addr_Tc, 
					bit_addr_r, bit_addr_ampm,bit_f1,bit_f2,bit_f3,bit_f4,bit_f12,bit_ent,
					bit_arriba,bit_abajo,bit_lados;
   wire [7:0] font_word;
   wire font_bit, hora_on, Thora_on, fecha_on, Tfecha_on, crono_on, Tcrono_on, ring_on, ampm_on;
   wire F_1on,F_2on,F_3on,F_4on,F_12on,F_enton,F_arribaon,F_abajoon,F_ladoson;

// Instantiate the module
font_rom instance_name (
    .clk(clk), 
    .addr(rom_addr), 
    .data(font_word)
    );




   //-------------------------------------------
   // hora region
   //  - display two-digit score, ball on top left
   //  - scale to 64-by-128 font
   //  - line 32, 4 chars: "HORA"
   //-------------------------------------------
   assign hora_on = (0<=pix_y[9:5]) && (pix_y[9:5]<=3) && (3<=pix_x[8:6]) && (pix_x[8:6]<=6);
   assign row_addr_h = pix_y[6:3];
   assign bit_addr_h = pix_x[5:3];
   always @*begin
	char_addr_h = 3'o0;
      case (pix_x[8:6])
         3'o3: char_addr_h = 7'h48; // H
         3'o4: char_addr_h = 7'h4f; // O
         3'o5: char_addr_h = 7'h52; // R
         3'o6: char_addr_h = 7'h41; // A
       endcase
		end 
   //-------------------------------------------
   //  HORA numbers region:
   //   - display time
   //
   //   - scale to 32-by-64 
   //-------------------------------------------
   assign Thora_on = (4<=pix_y[9:5]) && (pix_y[9:5]<=5) &&
                    (3<=pix_x[8:6]) && (pix_x[8:6]<=6);
  //revisar apuntes si no funciona cordenadas y
   assign row_addr_Th = pix_y[5:2];
   assign bit_addr_Th= pix_x[4:2];
   always @*begin
	char_addr_Th = 4'h0;
      case (pix_x[8:5])
         4'h6: char_addr_Th = {3'b011, {1'b0, hora1[2:0]}}; //hora 1
         4'h7: char_addr_Th = {3'b011, hora2}; // hora 2
         4'h8: char_addr_Th = 7'h3a; // : 
         4'h9: char_addr_Th = {3'b011, min1}; //min 1
			4'ha: char_addr_Th = {3'b011, min2}; //min 2
			4'hb: char_addr_Th = 7'h3a; //:
			4'hc: char_addr_Th = {3'b011, sec1}; //sec 1
			4'hd: char_addr_Th = {3'b011, sec2}; //sec 2
      endcase
		end
		
	//------------------------------------------
	// region AM/PM
	//-----------display am pm
	// scales 32-by-64
	assign ampm_on =(4<=pix_y[9:5]) && (pix_y[9:5]<=5) && (15<=pix_x[9:5]) &&
							(pix_x[9:5]<=16);
	assign row_addr_ampm = pix_y[5:2];
	assign bit_addr_ampm = pix_x[4:2];
	always @*begin
	char_addr_ampm = 7'h00;
		case (pix_x[9:5])
			5'h0f: char_addr_ampm = {hora1[3]+3'b100, 4'b0001-hora1[3]};//A o P
			5'h10: char_addr_ampm = 7'h4d; //M
		endcase
	end
	
   //-------------------------------------------
   // fecha region
   //   - display fecha
   //   - scale 32 by 64 font
   //     
   //-------------------------------------------
   assign fecha_on = (pix_y[8:6]==4) && (2<=pix_x[9:5]) && (pix_x[9:5]<=6);
   assign row_addr_f = pix_y[5:2];
   assign bit_addr_f = pix_x[4:2];
   always @*begin
	char_addr_f = 3'o0;
      case (pix_x[7:5])
         // row 1
         3'o2: char_addr_f = 7'h46; // F
         3'o3: char_addr_f = 7'h45; // E
         3'o4: char_addr_f = 7'h43; // C
         3'o5: char_addr_f = 7'h48; // H
         3'o6: char_addr_f = 7'h41; // A
       endcase
		 end
   //-------------------------------------------
   // DATE region
   //  - display "DATE 00/00/00" 
   //  - scale to 16-by-32 fonts
   //-----------------------------------------
   assign Tfecha_on = (pix_y[8:5]==10) &&
                    (1<=pix_x[9:6]) && (pix_x[9:6]<=2);
   assign row_addr_Tf = pix_y[4:1];
   assign bit_addr_Tf = pix_x[3:1];
   always @* begin
	char_addr_Tf = 4'h0;
      case(pix_x[7:4])
         4'h4: char_addr_Tf = {3'b011, dia1}; //dia 1
         4'h5: char_addr_Tf = {3'b011, dia2}; //dia 2
         4'h6: char_addr_Tf = 7'h2f;          // "/" 
         4'h7: char_addr_Tf = {3'b011, mes1}; //mes 1 
         4'h8: char_addr_Tf = {3'b011, mes2}; //mes 2
			4'h9: char_addr_Tf = 7'h2f;          // "/"
         4'ha: char_addr_Tf = {3'b011, ano1}; //año 1
         4'hb: char_addr_Tf = {3'b011, ano2}; //año 2
        
      endcase
		end
	//CRONO region
	//
	//
	//scale 32-by-64
   assign crono_on = (pix_y[9:6]==4) &&
                    (11<=pix_x[8:5]) && (pix_x[8:5]<=15);
   assign row_addr_c = pix_y[5:2];
   assign bit_addr_c = pix_x[4:2];
   always @*begin
	char_addr_c = 4'h0;
      case(pix_x[8:5])
         4'hb: char_addr_c = 7'h43; //C
         4'hc: char_addr_c = 7'h52; //R
         4'hd: char_addr_c = 7'h4f; //O 
         4'he: char_addr_c = 7'h4e; //N 
         4'hf: char_addr_c = 7'h4f; //O  
      endcase	
	end	
	//time crono region
	//
	//
	//scale 16-by-32
	assign Tcrono_on = (pix_y[8:5]==10) &&
                    (11<=pix_x[8:5]) && (pix_x[8:5]<=14);
   assign row_addr_Tc = pix_y[4:1];
   assign bit_addr_Tc = pix_x[3:1];
   always @*begin
	char_addr_Tc = 4'h0;
      case(pix_x[7:4])
         4'h6: char_addr_Tc = {3'b011, ch1}; //hora 1 del crono
         4'h7: char_addr_Tc = {3'b011, ch2}; //hora 2 del crono
         4'h8: char_addr_Tc = 7'h3a;         //:
         4'h9: char_addr_Tc = {3'b011, cm1}; // min 1 del crono
         4'ha: char_addr_Tc = {3'b011, cm2}; // min 2 del crono
			4'hb: char_addr_Tc = 7'h3a;         //:
			4'hc: char_addr_Tc = {3'b011, cs1}; // sec 1 del crono
			4'hd: char_addr_Tc = {3'b011, cs2}; // sec 2 del crono
		endcase
		end
	// RING region
   //
   // scale 32-by-64 font
	assign ring_on = (pix_y[8:6]==6) && (activring==1) &&
                    (8<=pix_x[8:5]) && (pix_x[8:5]<=12);
   assign row_addr_r = pix_y[5:2];
   assign bit_addr_r = pix_x[4:2];
   always @*begin
		char_addr_r = 7'h00;
      case(pix_x[8:5])
         4'h8: char_addr_r = 7'h2a; //*
         4'h9: char_addr_r = 7'h52; //R
         4'ha: char_addr_r = 7'h49; //I 
         4'hb: char_addr_r = 7'h4e; //N 
         4'hc: char_addr_r = 7'h47; //G  
      endcase	
	end
////// F1//////////	
	assign F_1on = (pix_y[9:4]==24) && (0<=pix_x[9:6]) && (pix_x[9:6]<=1);
   assign row_f1 = pix_y[3:0];
   assign bit_f1 = pix_x[2:0];
   always @*begin
	char_f1 = 4'h0;
      case (pix_x[6:3])
         4'h2: char_f1 = 7'h46; // F
         4'h3: char_f1 = 7'h31; // 1
         4'h4: char_f1 = 7'h3a; // :
         4'h5: char_f1 = 7'h20; // 
			4'h6: char_f1 = 7'h43; // C
         4'h7: char_f1 = 7'h4f; // O
         4'h8: char_f1 = 7'h4e; // N
         4'h9: char_f1 = 7'h46; // F
			4'ha: char_f1 = 7'h49; // I
         4'hb: char_f1 = 7'h47; // G
         4'hc: char_f1 = 7'h55; // U
         4'hd: char_f1 = 7'h52; // R
         4'he: char_f1 = 7'h41; // A
         4'hf: char_f1 = 7'h52; // R

       endcase
		end 
////// F2//////////	
	assign F_2on = (pix_y[9:4]==25) && (0<=pix_x[9:6]) && (pix_x[9:6]<=1);
   assign row_f2 = pix_y[3:0];
   assign bit_f2 = pix_x[2:0];
   always @*begin
	char_f2 = 4'h0;
      case (pix_x[6:3])
         4'h2: char_f2 = 7'h46; // F
         4'h3: char_f2 = 7'h32; // 2
         4'h4: char_f2 = 7'h3a; // :
         4'h5: char_f2 = 7'h20; // 
			4'h6: char_f2 = 7'h43; // C
         4'h7: char_f2 = 7'h4c; // L
         4'h8: char_f2 = 7'h4b; // K
         4'h9: char_f2 = 7'h2f; // /
			4'ha: char_f2 = 7'h43; // C
         4'hb: char_f2 = 7'h52; // R
         4'hc: char_f2 = 7'h4f; // O
         4'hd: char_f2 = 7'h4e; // N
         4'he: char_f2 = 7'h4f; // O

       endcase
		end 
////// F3//////////	
	assign F_3on = (pix_y[9:4]== 26) && (0<=pix_x[9:6]) && (pix_x[9:6]<=1);
   assign row_f3 = pix_y[3:0];
   assign bit_f3 = pix_x[2:0];
   always @*begin
	char_f3 = 4'h0;
      case (pix_x[6:3])
         4'h2: char_f3 = 7'h46; // F
         4'h3: char_f3 = 7'h33; // 3
         4'h4: char_f3 = 7'h3a; // :
         4'h5: char_f3 = 7'h20; // 
			4'h6: char_f3 = 7'h31; // 1
         4'h7: char_f3 = 7'h32; // 2
         4'h8: char_f3 = 7'h2f; // /
         4'h9: char_f3 = 7'h32; // 2
			4'ha: char_f3 = 7'h34; // 4

       endcase
		end	
////// F4//////////	
	assign F_4on = (pix_y[9:4]==27) && (0<=pix_x[9:6]) && (pix_x[9:6]<=1);
   assign row_f4 = pix_y[3:0];
   assign bit_f4 = pix_x[2:0];
   always @*begin
	char_f4 = 4'h0;
      case (pix_x[6:3])
         4'h2: char_f4 = 7'h46; // F
         4'h3: char_f4 = 7'h34; // 4
         4'h4: char_f4 = 7'h3a; // :
         4'h5: char_f4 = 7'h20; // 
			4'h6: char_f4 = 7'h45; // E
         4'h7: char_f4 = 7'h53; // S
         4'h8: char_f4 = 7'h43; // C
         4'h9: char_f4 = 7'h52; // R
			4'ha: char_f4 = 7'h49; // I
			4'hb: char_f4 = 7'h42; // B
         4'hc: char_f4 = 7'h49; // I
			4'hd: char_f4 = 7'h52; // R
			endcase
		end
			
////// F12//////////	
	assign F_12on = (pix_y[9:4]==28) && (0<=pix_x[9:6]) && (pix_x[9:6]<=1);
   assign row_f12 = pix_y[3:0];
   assign bit_f12 = pix_x[2:0];
   always @*begin
	char_f12 = 4'h0;
      case (pix_x[6:3])
         4'h1: char_f12 = 7'h46; // F
         4'h2: char_f12 = 7'h31; // 1
         4'h3: char_f12 = 7'h32; // 2
         4'h4: char_f12 = 7'h3a; // :
			4'h5: char_f12 = 7'h20; // 
         4'h6: char_f12 = 7'h49; // I
         4'h7: char_f12 = 7'h4e; // N
         4'h8: char_f12 = 7'h49; // I
			4'h9: char_f12 = 7'h43; // C
			4'ha: char_f12 = 7'h49; // I
			4'hb: char_f12 = 7'h41; // A
         4'hc: char_f12 = 7'h4c; // L
         4'hd: char_f12 = 7'h49; // I
			4'he: char_f12 = 7'h5a; // Z
			4'hf: char_f12 = 7'h41; // A
       endcase
		end				
////// F5//////////	
	assign F_enton = (pix_y[9:4] == 25) && (pix_x[9:7] == 4) ;
   assign row_ent = pix_y[3:0];
   assign bit_ent = pix_x[2:0];
   always @*begin
	char_ent = 4'h0;
      case (pix_x[6:3])
         4'h1: char_ent = 7'h46; // F
         4'h2: char_ent = 7'h35; // 5
         4'h3: char_ent = 7'h3a; // :
         4'h4: char_ent = 7'h20; // 
			4'h5: char_ent = 7'h41; // A
         4'h6: char_ent = 7'h4c; // L
         4'h7: char_ent = 7'h41; // A
         4'h8: char_ent = 7'h52; // R
			4'h9: char_ent = 7'h4d; // M
			4'ha: char_ent = 7'h41; // A
			4'hb: char_ent = 7'h2f; // /
         4'hc: char_ent = 7'h4f; // O
         4'hd: char_ent = 7'h46; // F
			4'he: char_ent = 7'h46; // F
       endcase
		end	
////// flecha arriba//////////	
	assign F_arribaon = (pix_y[9:4] == 26) && (7<=pix_x[9:6]) && (pix_x[9:6]<=8);
   assign row_arriba = pix_y[3:0];
   assign bit_arriba = pix_x[2:0];
   always @*begin
	char_arriba = 4'h0;
      case (pix_x[6:3])
         4'h6: char_arriba = 7'h18; // flecha hacia arriba
         
       endcase
		end		
////// flechas lados//////////	
	assign F_ladoson = (pix_y[9:4] == 27) && (7<=pix_x[9:6]) && (pix_x[9:6]<=8);
   assign row_lados = pix_y[3:0];
   assign bit_lados = pix_x[2:0];
   always @*begin
	char_lados = 4'h0;
      case (pix_x[6:3])
         4'h5: char_lados = 7'h1b; // izquierda
   		4'h6: char_lados = 7'h20; // 
         4'h7: char_lados = 7'h1a; // derecha
		endcase	
	end						
////// flecha abajo//////////	
	assign F_abajoon = (pix_y[9:4] == 28) && (7<=pix_x[9:6]) && (pix_x[9:6]<=8);
   assign row_abajo = pix_y[3:0];
   assign bit_abajo = pix_x[2:0];
   always @*begin
	char_abajo = 4'h0;
      case (pix_x[6:3])
         
         4'h6: char_abajo = 7'h19; // flecha abajo
			
       endcase
		end								
   //-------------------------------------------
   // mux for font ROM addresses and rgb
   //-------------------------------------------
   always @*
   begin
      text_rgb = 3'b000;  // background, black
		char_addr = 7'b0000000;
      row_addr = 4'b0000;
      bit_addr = 3'b000;
      if (hora_on && video_on)
         begin
            char_addr = char_addr_h;
            row_addr = row_addr_h;
            bit_addr = bit_addr_h;
            if (font_bit)
               text_rgb = 3'b010; //green
				else 
					text_rgb =3'b000;
         end
	////F1/////	
		else if (F_1on && video_on)
			begin
				char_addr = char_f1;
				row_addr = row_f1;
				bit_addr = bit_f1;
				if (font_bit)
					text_rgb = 3'b011;//rojo
				else
					text_rgb = 3'b000;//negro
			end
	////F1/////
		else if (F_2on && video_on)
			begin
				char_addr = char_f2;
				row_addr = row_f2;
				bit_addr = bit_f2;
				if (font_bit)
					text_rgb = 3'b011;//rojo
				else
					text_rgb = 3'b000;//negro
			end	
	////F3/////	
		else if (F_3on && video_on)
			begin
				char_addr = char_f3;
				row_addr = row_f3;
				bit_addr = bit_f3;
				if (font_bit)
					text_rgb = 3'b011;//rojo
				else
					text_rgb = 3'b000;//negro
			end
	////F4/////
		else if (F_4on && video_on)
			begin
				char_addr = char_f4;
				row_addr = row_f4;
				bit_addr = bit_f4;
				if (font_bit)
					text_rgb = 3'b011;//rojo
				else
					text_rgb = 3'b000;//negro
			end	

	////F12/////
		else if (F_12on && video_on)
			begin
				char_addr = char_f12;
				row_addr = row_f12;
				bit_addr = bit_f12;
				if (font_bit)
					text_rgb = 3'b011;//rojo
				else
					text_rgb = 3'b000;//negro
			end	
	////F5/////
		else if (F_enton && video_on)
			begin
				char_addr = char_ent;
				row_addr = row_ent;
				bit_addr = bit_ent;
				if (font_bit)
					text_rgb = 3'b011;//rojo
				else
					text_rgb = 3'b000;//negro
			end	
////Arriba/////
		else if (F_arribaon && video_on)
			begin
				char_addr = char_arriba;
				row_addr = row_arriba;
				bit_addr = bit_arriba;
				if (font_bit)
					text_rgb = 3'b011;//rojo
				else
					text_rgb = 3'b000;//negro
			end
////Lados/////
		else if (F_ladoson && video_on)
			begin
				char_addr = char_lados;
				row_addr = row_lados;
				bit_addr = bit_lados;
				if (font_bit)
					text_rgb = 3'b011;//rojo
				else
					text_rgb = 3'b000;//negro
			end
////Abajo/////
		else if (F_abajoon && video_on)
			begin
				char_addr = char_abajo;
				row_addr = row_abajo;
				bit_addr = bit_abajo;
				if (font_bit)
					text_rgb = 3'b011;//rojo
				else
					text_rgb = 3'b000;//negro
			end			
      else if (Thora_on && video_on)
         begin
				char_addr = char_addr_Th;
				row_addr = row_addr_Th;
				bit_addr = bit_addr_Th;
				
				if(6<=pix_x[9:5] && pix_x[9:5]<=7 && bandera_Hhora && font_bit)
					text_rgb = 3'b100; //red
				else if(9<=pix_x[9:5] && pix_x[9:5]<=10 && bandera_Mhora && font_bit)
					text_rgb = 3'b100; //red
				else if(12<=pix_x[9:5] && pix_x[9:5]<=13 && bandera_Shora && font_bit)
					text_rgb = 3'b100; //red
				else if(font_bit)
					text_rgb =3'b111; //white		
				else 
					text_rgb =3'b000;
         end
			
		else if (ampm_on && video_on && formato_12)
			begin
				char_addr = char_addr_ampm;
				row_addr = row_addr_ampm;
				bit_addr = bit_addr_ampm;
				if (font_bit)
					text_rgb = 3'b011;//rojo
				else
					text_rgb = 3'b000;//negro
			end
				
      else if (fecha_on && video_on)
         begin
            char_addr = char_addr_f;
            row_addr = row_addr_f;
            bit_addr = bit_addr_f;
            if (font_bit)
               text_rgb = 3'b010; //green
				else 
					text_rgb =3'b000;
         end
			
		 else if (Tfecha_on && video_on)
         begin
            char_addr = char_addr_Tf;
            row_addr = row_addr_Tf;
            bit_addr = bit_addr_Tf;
				if (4<=pix_x[9:4] && pix_x[9:4]<=5 && bandera_Dfecha && font_bit)
					text_rgb = 3'b100; //red
				else if(7<=pix_x[9:4] && pix_x[9:4]<=8 && bandera_Mfecha && font_bit)
					text_rgb = 3'b100; //red
				else if(10<=pix_x[9:4] && pix_x[9:4]<=11 && bandera_Afecha && font_bit)
					text_rgb = 3'b100; //red
            else if (font_bit)
               text_rgb = 3'b111; //white
				else 
					text_rgb =3'b000;	
         end
			
		 else if (crono_on && video_on)
         begin
            char_addr = char_addr_c;
            row_addr = row_addr_c;
            bit_addr = bit_addr_c;
            if (font_bit)
               text_rgb = 3'b010; //green
				else 
					text_rgb =3'b000;
         end
			
		 else if (Tcrono_on && video_on)
         begin
            char_addr = char_addr_Tc;
            row_addr = row_addr_Tc;
            bit_addr = bit_addr_Tc;
				if (6<=pix_x[7:4]&& pix_x[7:4]<=7 && bandera_Hcrono)begin
					if (font_bit)
						text_rgb = 3'b100; //red
					else 
					text_rgb =3'b000;end	
				else if(9<=pix_x[7:4] && pix_x[7:4]<=10 && bandera_Mcrono)begin
					if (font_bit)
						text_rgb = 3'b100;//red
					else 
						text_rgb = 3'b000;end
				else if((12<=pix_x[7:4] && pix_x[7:4]<=13 && bandera_Scrono)| (pix_x[0] == 0 && pix_y[0] == 0))begin
					if (font_bit)
						text_rgb = 3'b100; //red
					else 
					text_rgb =3'b000;end
				else if (font_bit)
					text_rgb = 3'b111; //white
				else 
					text_rgb =3'b000;
         end
		
		 else if (ring_on && activring && video_on)
         begin
            char_addr = char_addr_r;
            row_addr = row_addr_r;
            bit_addr = bit_addr_r;
            if (font_bit)
               text_rgb = 3'b100; //red
				else 
					text_rgb =3'b000;
         end
      else 
				text_rgb =3'b000;
   end

   assign text_on = {hora_on, Thora_on, fecha_on, Tfecha_on, crono_on, Tcrono_on, ring_on};
   //-------------------------------------------
   // font rom interface
   //-------------------------------------------
   assign rom_addr = {char_addr, row_addr};
   assign font_bit = font_word[~bit_addr];

endmodule


