`timescale 1 ns/1 ns
module ifft(clk,sel,yr,yi);
input clk;
input [2:0] sel;
output reg [11:0] yr,yi;
wire [11:0] y0r,y1r,y2r,y3r,y4r,y5r,y6r,y7r,y0i,y1i,y2i,y3i,y4i,y5i,y6i,y7i;
wire [11:0] in20r,in20i,in21r,in21i,in22r,in22i,in23r,in23i,in24r,in24i,in25r,in25i,in26r,in26i,in27r,in27i;
wire [11:0] in10r,in10i,in11r,in11i,in12r,in12i,in13r,in13i,in14r,in14i,in15r,in15i,in16r,in16i,in17r,in17i;
wire [11:0] in0_r,in1_r,in2_r,in3_r,in4_r,in5_r,in6_r,in7_r,in0_i,in1_i,in2_i,in3_i,in4_i,in5_i,in6_i,in7_i;
wire [11:0] y0_r,y1_r,y2_r,y3_r,y4_r,y5_r,y6_r,y7_r,y0_i,y1_i,y2_i,y3_i,y4_i,y5_i,y6_i,y7_i;
parameter w0r=9'b1;
parameter w0i=9'b0;
parameter w1r=9'b010110101;                                        
parameter w1i=9'b010110101;                                        
parameter w2r=9'b0;
parameter w2i=9'b000000001;                                       
parameter w3r=9'b101001011;                                   
parameter w3i=9'b010110101; 
parameter N_inv=4'b0001;                                       
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
//Divide by N
divide_N d0(y0r,y0i,N_inv,y0_r,y0_i);
divide_N d1(y1r,y1i,N_inv,y1_r,y1_i);
divide_N d2(y2r,y2i,N_inv,y2_r,y2_i);
divide_N d3(y3r,y3i,N_inv,y3_r,y3_i);
divide_N d4(y4r,y4i,N_inv,y4_r,y4_i);
divide_N d5(y5r,y5i,N_inv,y5_r,y5_i);
divide_N d6(y6r,y6i,N_inv,y6_r,y6_i);
divide_N d7(y7r,y7i,N_inv,y7_r,y7_i);

always@(posedge clk)
case(sel)
0:begin yr=y0_r; yi=y0_i; end
1:begin yr=y1_r; yi=y1_i; end
2:begin yr=y2_r; yi=y2_i; end
3:begin yr=y3_r; yi=y3_i; end
4:begin yr=y4_r; yi=y4_i; end
5:begin yr=y5_r; yi=y5_i; end
6:begin yr=y6_r; yi=y6_i; end
7:begin yr=y7_r; yi=y7_i; end
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
module divide_N (y_r,y_i,n_inv,yr,yi);
input signed [3:0] n_inv;
input signed [11:0] y_r,y_i;
wire [15:0] p1,p2;
output [11:0]yr,yi;
assign p1=y_r*n_inv;
assign yr=p1[14:3];
assign p2=y_i*n_inv;
assign yi=p2[14:3];
    
endmodule
