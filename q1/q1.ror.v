module ror(en,
ctrl,bits,out
);
parameter n =4;
  input en;
  input [1:0]ctrl;//specify the number of rotation
  //00:No change
  //01 ROR#1
  //10 ROR#2
  //11 ROR#3
  input [n-1:0]bits;//input bits
  output [n-1:0]out;
wire [n-1:0]k;
//structural modelling using 2:1 MUX
mux2_1 uut1(en,bits[0],bits[2],ctrl[1],k[0]);
mux2_1 uut2(en,bits[1],bits[3],ctrl[1],k[1]);
mux2_1 uut3(en,bits[2],bits[0],ctrl[1],k[2]);
mux2_1 uut4(en,bits[3],bits[1],ctrl[1],k[3]);

mux2_1 uut5(en,k[0],k[1],ctrl[0],out[0]);
mux2_1 uut6(en,k[1],k[2],ctrl[0],out[1]);
mux2_1 uut7(en,k[2],k[3],ctrl[0],out[2]);
mux2_1 uut8(en,k[3],k[0],ctrl[0],out[3]);


endmodule
