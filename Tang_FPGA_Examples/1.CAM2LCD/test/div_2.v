module div_2 (q,clk,reset); //   ���q������ʱ��CLK��ͬ����λ�ź�RESET.
    output q;
    input reset;
    input clk;
    reg q;
    always @ (posedge clk or posedge reset)
    if (reset==0)
      q<=1'b0; // ��λ����
      else
      q<=~q; // ����q�źŷ�ת
endmodule

