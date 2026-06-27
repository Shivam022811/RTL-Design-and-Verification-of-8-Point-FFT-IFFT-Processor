`timescale 1 ns/1 ns
module dit_fft(clk,sel,yr,yi);
input clk;
input [2:0] sel;
output reg [11:0] yr,yi;
wire [11:0] y0r,y1r,y2r,y3r,y4r,y5r,y6r,y7r,y0i,y1i,y2i,y3i,y4i,y5i,y6i,y7i;
wire [11:0] in20r,in20i,in21r,in21i,in22r,in22i,in23r,in23i,in24r,in24i,in25r,in25i,in26r,in26i,in27r,in27i;
wire [11:0] in10r,in10i,in11r,in11i,in12r,in12i,in13r,in13i,in14r,in14i,in15r,in15i,in16r,in16i,in17r,in17i;
wire [11:0] in0_r,in1_r,in2_r,in3_r,in4_r,in5_r,in6_r,in7_r,in0_i,in1_i,in2_i,in3_i,in4_i,in5_i,in6_i,in7_i;
parameter w0r=9'b1;
parameter w0i=9'b0;
parameter w1r=9'b010110101;                                        
parameter w1i=9'b101001011;                                        
parameter w2r=9'b0;
parameter w2i=9'b111111111;                                       
parameter w3r=9'b101001011;                                   
parameter w3i=9'b101001011;                                        
//INPUT(Real part)
assign in0_r=12'b000001000000;                                                   
assign in1_r=12'b000000110000;                                                   
assign in2_r=12'b000001100000;                                                   
assign in3_r=12'b000010000000;                                                   
assign in4_r=12'b000000010000;                                                   
assign in5_r=12'b000000100000;                                                   
assign in6_r=12'b000001010000;                                                   
assign in7_r=12'b000000110000;                                                   
//INPUT(Imaginary part)
assign in0_i=12'b0;                                                   
assign in1_i=12'b0;                                                   
assign in2_i=12'b0;                                                   
assign in3_i=12'b0;                                                   
assign in4_i=12'b0;                                                   
assign in5_i=12'b0;                                                   
assign in6_i=12'b0;                                                   
assign in7_i=12'b0; 
//STAGE 1
bfly_1 s11(in0_r,in0_i,in4_r,in4_i,w0r,w0i,in10r,in10i,in11r,in11i);              
bfly_1 s12(in2_r,in2_i,in6_r,in6_i,w0r,w0i,in12r,in12i,in13r,in13i);              
bfly_1 s13(in1_r,in1_i,in5_r,in5_i,w0r,w0i,in14r,in14i,in15r,in15i);              
bfly_1 s14(in3_r,in3_i,in7_r,in7_i,w0r,w0i,in16r,in16i,in17r,in17i);              
//STAGE 2
bfly_1 s21(in10r,in10i,in12r,in12i,w0r,w0i,in20r,in20i,in22r,in22i);
bfly_1 s22(in11r,in11i,in13r,in13i,w2r,w2i,in21r,in21i,in23r,in23i);
bfly_1 s23(in14r,in14i,in16r,in16i,w0r,w0i,in24r,in24i,in26r,in26i);
bfly_1 s24(in15r,in15i,in17r,in17i,w2r,w2i,in25r,in25i,in27r,in27i);

//STAGE 3
bfly_1 s31(in20r,in20i,in24r,in24i,w0r,w0i,y0r,y0i,y4r,y4i);
bfly_2 s32(in21r,in21i,in25r,in25i,w1r,w1i,y1r,y1i,y5r,y5i);
bfly_1 s33(in22r,in22i,in26r,in26i,w2r,w2i,y2r,y2i,y6r,y6i);
bfly_2 s34(in23r,in23i,in27r,in27i,w3r,w3i,y3r,y3i,y7r,y7i);
  
always@(posedge clk)
case(sel)
0:begin yr=y0r; yi=y0i; end
1:begin yr=y1r; yi=y1i; end
2:begin yr=y2r; yi=y2i; end
3:begin yr=y3r; yi=y3i; end
4:begin yr=y4r; yi=y4i; end
5:begin yr=y5r; yi=y5i; end
6:begin yr=y6r; yi=y6i; end
7:begin yr=y7r; yi=y7i; end
endcase
endmodule
module bfly_2(inr,ini,yr,yi,wr,wi,in0r,in0i,in1r,in1i);
input signed [11:0]inr,ini,yr,yi;
input signed [8:0]wr,wi;
output [11:0]in0r,in0i,in1r,in1i;
wire [20:0]p1,p2,p3,p4;
assign p1=wr*yr;
assign p2=wi*yi;
assign p3=wr*yi;
assign p4=wi*yr;
assign in0r=inr+p1[19:8]-p2[19:8];
assign in0i=ini+p3[19:8]+p4[19:8];
assign in1r=inr-p1[19:8]+p2[19:8];
assign in1i=ini-p3[19:8]-p4[19:8];
endmodule
module bfly_1(inr,ini,yr,yi,wr,wi,in0r,in0i,in1r,in1i);
input signed [11:0]inr,ini,yr,yi;
input signed [8:0]wr,wi;
output [11:0]in0r,in0i,in1r,in1i;
wire [20:0]p1,p2,p3,p4;
assign p1=wr*yr;
assign p2=wi*yi;
assign p3=wr*yi;
assign p4=wi*yr;
assign in0r=inr+p1[11:0]-p2[11:0];
assign in0i=ini+p3[11:0]+p4[11:0];
assign in1r=inr-p1[11:0]+p2[11:0];
assign in1i=ini-p3[11:0]-p4[11:0];
endmodule
