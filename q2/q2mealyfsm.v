module sqdet(input din, clk, rst,
                output reg dout);

reg [2:0]ps,ns;
parameter  R= 3'b000,A0 = 3'b001,A1 = 3'b010,A2 = 3'b011,A3 = 3'b100,A4 = 3'b101,A5 =3'b110;

 
always@(posedge clk or negedge rst) begin

    if(!rst)
        ps<=R;
    else
        ps<=ns;
   
  always@(ps,din)begin
    case(ps)
        R:begin
         if  (din==0) ns=A1; 
          else ns=A0;
         end
        A0:begin
         
          if(din==0) ns=A4;
          else ns=A0;
         end
        A1:begin
         
          if(din==0) ns=A1;
          else ns=A2;
         end 
        A2:begin
         
          if(din==0) ns=A3;
          else ns=A0;
         end 
        A3:begin
         
          if(din==0) ns=A5;
          else ns=A2;
         end 
        A4:begin
        
          if(din==0) ns=A5;
          else ns=A2;
         end 
        A5:begin
         
          if(din==0) ns=A1;
          else ns=A2;
         end
         default:begin ns=R; end     
    endcase

end
  always@(*)begin
    case(ps)
        A3:if(din==0) dout=1;else dout=0;
        A5:if(din==1) dout=1;else dout =0;
        default:dout=0;
    endcase

end



endmodule
