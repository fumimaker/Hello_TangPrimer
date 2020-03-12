module top(
input wire CLK_IN,
input wire RST_N,
output wire [2:0] RGB_LED,
output reg BZ,
input wire [6:0] SW
);


reg [23:0] counter;


always @(posedge CLK_IN) begin
if(RST_N==1'b0) begin
	counter <= 24'd0;
end else begin
	if((!SW[0]&&counter==12000000/523) ||
		(!SW[1]&&counter==12000000/587) ||
		(!SW[2]&&counter==12000000/659) ||
		(!SW[3]&&counter==12000000/698) ||
		(!SW[4]&&counter==12000000/783) ||
		(!SW[5]&&counter==12000000/880) ||
		(!SW[6]&&counter==12000000/987))begin
		BZ <= ~BZ;
		counter = 24'd0;
		end
	else begin
		counter <= counter+24'd1;
		end
end
end
endmodule