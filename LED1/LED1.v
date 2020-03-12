module LED1(
input wire CLK_IN,
input wire RST_N,
output wire [2:0] RGB_LED
);

reg [23:0] counter;
reg led;

always @(posedge CLK_IN) begin
if(RST_N==1'b0) begin
	counter <= 24'd0;
	led <= 1'b0;
end else begin
	if(counter==24'd12000000) begin
		led <= ~led;
		counter <= 24'd0;
	end else begin
		counter <=counter+24'd1;
	end
end
end
assign RGB_LED = led ? 3'b111:3'b110;
endmodule