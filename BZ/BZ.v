module top(
input wire CLK_IN,
input wire RST_N,
output wire [2:0] RGB_LED,
output wire BZ
);


reg [23:0] counter;
reg led;
reg buzz;

always @(posedge CLK_IN) begin
if(RST_N==1'b0) begin
	counter <= 24'd0;
	led <= 1'b0;
	buzz <= 1'b0;
end else begin
	if(counter==12000000/440) begin
		led <= ~led;
		counter <= 24'd0;
		buzz <= ~buzz;
	end else begin
		counter <=counter+24'd1;
	end
end
end
assign RGB_LED = led ? 3'b111:3'b110;
assign BZ = buzz;
endmodule