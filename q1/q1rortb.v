module rort();
parameter n=4;
reg en; //enable
reg [n-1:0]ib; //input bits
reg [1:0]ctrl; //comtrol bits
wire [n-1:0]out; //output bits
ror uut(en,ctrl,ib,out);
initial begin 
en=1;
ib=4'b1101;
ctrl=2'b01;

//expected output 0111
end
endmodule
