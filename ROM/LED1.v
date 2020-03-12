module LED1(
input wire CLK_IN,
input wire RST_N,
output reg [2:0] VGA_RED,
output reg [2:0] VGA_GREEN,
output reg [2:0] VGA_BLUE,
output wire VGA_HSYNC,
output wire VGA_VSYNC
);
wire CLK_25MHZ;

pll0 pll0_inst(
	.refclk(CLK_IN),
	.reset(1'b0),
	.stdby(),
	.extlock(),
	.clk0_out(),
	.clk1_out(CLK_25MHZ)
);

wire hsync, vsync;
wire display_on;
wire [9:0] hpos;
wire [9:0] vpos;

hvsync_generator hvsync_inst(
	.clk(CLK_25MHZ),
	.reset(1'b0),
	.hsync(hsync),
	.vsync(vsync),
	.display_on(display_on),
	.hpos(hpos),
	.vpos(vpos)
);
wire [9:0] dout;
bitmaprom bitmaprom_inst(
	.clka(CLK_25MHZ),
	.doa(dout),
	.addra({vpos[7:0], hpos[7:0]}),
	.rsta(1'b0)
);

wire [10:0]counter;
assign counter = hpos+vpos;
always @(posedge CLK_IN) begin
	if(display_on) begin
		VGA_RED <= dout[8:6];
		VGA_GREEN <= dout[5:3];
		VGA_BLUE <= dout[2:0];
	end
end
assign VGA_HSYNC = ~hsync;
assign VGA_VSYNC = ~vsync;
endmodule