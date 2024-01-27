`timescale 1ns / 1ps

module sqdet(input din, clk, rst,
                output reg dout);

reg [3:0]ps,ns;
parameter  R= 4'b0000,A0 = 4'b0001,A1 = 4'b0010,A2 = 4'b0011,A3 = 4'b0100,A4 = 4'b0101,A5 =4'b0110,A6=4'b0111,A7=4'b1000;

 
always@(posedge clk or negedge rst) begin

    if(!rst)begin
        ps<=R;
        dout=0;end
     else
   
    case(ps)
        R:begin
         dout=0;
          if(din==0) ps=A1;
          else ps=A0;
         end
        A0:begin
         dout=0;
          if(din==0) ps=A4;
          else ps=A0;
         end
        A1:begin
         dout=0;
          if(din==0) ps=A1;
          else ps=A2;
         end 
        A2:begin
         dout=0;
          if(din==0) ps=A3;
          else ps=A0;
         end 
        A3:begin
         dout=0;
          if(din==0) ps=A6;
          else ps=A2;
         end 
        A4:begin
         dout=0;
          if(din==0) ps=A5;
          else ps=A2;
         end 
        A5:begin
         dout=0;
          if(din==0) ps=A1;
          else ps=A7;
         end
         A6:begin
          dout=1;
         
          if(din==0) ps=A1;
          else ps=A7;
         end
         A7:begin
         dout=1;
          if(din==0) ps=A3;
          else ps=A0;
         end
        default:begin dout =0 ;ns= R; end     
    endcase

end
endmodule