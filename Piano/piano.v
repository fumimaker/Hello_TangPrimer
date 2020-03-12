module top(
input wire CLK_IN,
input wire RST_N,
output wire [2:0] RGB_LED,
output wire BZ,
input wire [7:0] SW
);

reg [23:0] counter [7:0];
reg [7:0] wave;

always @(posedge CLK_IN) begin
	if(RST_N==1'b0) begin
		counter[0] <= 24'd0;
		counter[1] <= 24'd0;
		counter[2] <= 24'd0;
		counter[3] <= 24'd0;
		counter[4] <= 24'd0;
		counter[5] <= 24'd0;
		counter[6] <= 24'd0;
		counter[7] <= 24'd0;
		wave <= 8'd0;
	end else begin
		if(counter[0]==12000000/523) begin
			wave[0] <= ~wave[0];
			counter[0] <= 0;
			end;
		if(counter[1]==12000000/587) begin
			wave[1] <= ~wave[1];
			counter[1] <= 0;
			end;
		if(counter[2]==12000000/659) begin
			wave[2] <= ~wave[2];
			counter[2] <= 0;
			end;
		if(counter[3]==12000000/698) begin
			wave[3] <= ~wave[3];
			counter[3] <= 0;
			end;
		if(counter[4]==12000000/783) begin
			wave[4] <= ~wave[4];
			counter[4] <= 0;
			end;
		if(counter[4]==12000000/880) begin
			wave[4] <= ~wave[4];
			counter[4] <= 0;
			end;
		if(counter[5]==12000000/987) begin
			wave[5] <= ~wave[5];
			counter[5] <= 0;
			end;
		if(counter[6]==12000000/1046) begin
			wave[6] <= ~wave[6];
			counter[6] <= 0;
			end;
		if(counter[7]==12000000/2274) begin
			wave[7] <= ~wave[7];
			counter[7] <= 0;
			end;
	end
end
assign BZ = (!SW[0]&&wave[0])^
			(!SW[1]&&wave[1])^
			(!SW[2]&&wave[2])^
			(!SW[3]&&wave[3])^
			(!SW[4]&&wave[4])^
			(!SW[5]&&wave[5])^
			(!SW[6]&&wave[6])^
			(!SW[7]&&wave[7]);
endmodule