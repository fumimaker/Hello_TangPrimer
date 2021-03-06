/************************************************************\
 **  Copyright (c) 2011-2021 Anlogic, Inc.
 **  All Right Reserved.
\************************************************************/
/************************************************************\
 ** Log	:	This file is generated by Anlogic IP Generator.
 ** File	:	H:/Work/FPGA/AnLogic/LicheeTang/demo/test_lcd_camera/test_camera/project/al_ip/ip_ram.v
 ** Date	:	2018 07 28
 ** TD version	:	4.2.217
\************************************************************/

`timescale 1ns / 1ps

module img_cache ( 
	dia, addra, cea, clka, rsta, 
	dob, addrb, ceb, clkb, rstb
);

	output [15:0] dob;


	input  [15:0] dia;
	input  [15:0] addra;
	input  [15:0] addrb;
	input  cea;
	input  ceb;
	input  clka;
	input  clkb;
	input  rsta;
	input  rstb;




	EG_LOGIC_BRAM #( .DATA_WIDTH_A(16),
				.DATA_WIDTH_B(16),
				.ADDR_WIDTH_A(16),
				.ADDR_WIDTH_B(16),
				.DATA_DEPTH_A(32800),
				.DATA_DEPTH_B(32800),
				.MODE("PDPW"),
				.REGMODE_A("NOREG"),
				.REGMODE_B("NOREG"),
				.WRITEMODE_A("NORMAL"),
				.WRITEMODE_B("NORMAL"),
				.RESETMODE("SYNC"),
				.IMPLEMENT("9K"),
				.INIT_FILE("NONE"),
				.FILL_ALL("NONE"))
			inst(
				.dia(dia),
				.dib({16{1'b0}}),
				.addra(addra),
				.addrb(addrb),
				.cea(cea),
				.ceb(ceb),
				.ocea(1'b0),
				.oceb(1'b0),
				.clka(clka),
				.clkb(clkb),
				.wea(1'b1),
				.web(1'b0),
				.bea(1'b0),
				.beb(1'b0),
				.rsta(rsta),
				.rstb(rstb),
				.doa(),
				.dob(dob));


endmodule