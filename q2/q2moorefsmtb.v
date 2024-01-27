`timescale 1ns / 1ps

module simt();
  reg din, clk, rst;
  wire dout;
 
  
sqdet u0 (din, clk, rst, dout);
  
initial begin
clk=1;forever#2.5 clk=~clk;end
  
initial begin
 rst=0;
 din=0;
 #5
 rst=1;
 din=1;
 #5
 din=0;#5
 din=0;#5
 din=1;#5
 din=0;#5
 din=0;#5
 din=1;#5
 din=0;#5
 din=0;#5
 din=1;#5
 din=0;#5
 
 $finish;
 
end 
 

endmodule