
`ifdef IMGTEST
module Imagedata_send
	(
      	input wire clk_lcd,			//ϵͳʱ�ӣ�Ĭ��50M
      	input wire rst_n,			//��λ�źţ��͵�ƽ��Ч
      	input wire den,			//TFT����ʹ��
      	input wire [10:0] hcount,	//TFT��ɨ�������
      	input wire [10:0] vcount,	//TFT��ɨ�������
		input wire clk,
      	output wire [7:0] R,
      	output wire [7:0] G,
		output wire [7:0] B
  	);
  	
  	 parameter HSYNC_BLANK_WIDTH = 256; // thb
  	 parameter VSYNC_BLANK_WIDTH = 45;	//tvb

     wire img_ack;              //ͼƬ����ʹ��
     wire [23:0]img_data;       //����ͼƬ����
     reg [23:0]imgd;

     localparam IMG_H = 100,  //ͼƬ�����ص����
                  IMG_V = 100;  //ͼƬ�����ص����
                   
     localparam TFT_H = 800,  //TFT�������ص����
                  TFT_V = 480;  //TFT�������ص����
                   
     localparam IMG_HM = TFT_H - IMG_H,  //ͼƬ�з�����ƶ����ص����
                IMG_VM = TFT_V - IMG_V;    //ͼƬ��������ƶ����ص����
                   
     reg [10:0]img_hbegin = 100;   //ͼƬ���Ͻǵ�һ�����ص���TFT������������
     reg [10:0]img_vbegin = 100;   //ͼƬ���Ͻǵ�һ�����ص���TFT���ĳ�������
     
	 assign img_ack = den && ((hcount - HSYNC_BLANK_WIDTH) >= img_hbegin && (hcount - HSYNC_BLANK_WIDTH) < img_hbegin + IMG_H) &&
                           ((vcount - VSYNC_BLANK_WIDTH) >= img_vbegin && (vcount - VSYNC_BLANK_WIDTH) < img_vbegin + IMG_V)?1'b1:1'b0;
                           

//	reg [31:0]timecnt;
//	reg [10:0]plus;
//	reg vdir,hdir;
	
//	initial
//	begin
//		plus<=1;
//		hdir<=1;;
//		vdir<=1;
//	end
	
//	always@(posedge clk)
//	begin
//          timecnt <= timecnt + 1'b1;
//		  if(timecnt == 2_400_000)
//			begin
//				timecnt <= 0;
				
//				if(hdir==1)
//					begin
//						img_hbegin <= img_hbegin + plus;
//					end
//				else
//					begin
//						img_hbegin <= img_hbegin - plus;
//					end
					
//				if(vdir==1)
//					begin
//						img_vbegin <= img_vbegin + plus;
//					end
//				else
//					begin
//						img_vbegin <= img_vbegin - plus;
//					end
//					/*
//				if((img_vbegin == 0) || (img_vbegin == IMG_VM))
//					begin
//						vdir = ~vdir;
//						plus<=5;
//						imgd<=24'hff0000;
//					end

//				if((img_hbegin == 0) || (img_hbegin == IMG_HM))
//					begin
//						hdir = ~hdir;
//						plus<=10;
//						imgd<=24'h0000ff;
//					end
//					*/
//			end
//	end

//	assign imgd = 24'h00ff00;
    assign img_data = img_ack ? 24'h00ff00 : 24'h0;
    
	assign B = img_data[7:0];
	assign G = img_data[15:8];
	assign R = img_data[23:16];

 endmodule
`endif