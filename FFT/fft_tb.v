`timescale 1ns/1ns 
`include"fft.v"
module testbench; 
reg clk;
reg [2:0] sel;
wire [11:0] yr,yi;
dit_fft dit_fft_test(.clk(clk),.sel(sel),.yr(yr),.yi(yi)); 
initial
begin clk = 0;
end 
always 
begin
#5
clk = ~clk;
end
initial 
begin
#100 sel = 3'b000;#100 
sel = 3'b001;#100 
sel = 3'b010;#100 
sel = 3'b011;#100 
sel = 3'b100;#100 
sel = 3'b101;#100 
sel = 3'b110;#100 
sel = 3'b111;
end 
initial begin
$dumpfile("dump1.vcd");
$dumpvars;
#10000 $finish;
end
  
endmodule
