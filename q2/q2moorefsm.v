module sqdet(input din, clk, rst,
                output reg dout);

reg [3:0]ps,ns;
parameter  R= 4'b0000,A0 = 4'b0001,A1 = 4'b0010,A2 = 4'b0011,A3 = 4'b0100,A4 = 4'b0101,A5 =4'b0110,A6=4'b0111,A7=4'b1000;


always@ (posedge clk or negedge rst) begin

    if(!rst)

        ps<=R;

  else
			ps<=ns;
	end
always@(ps or din)
begin
    case(ps)
        R:begin

          if(din==0) ns=A1;
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

          if(din==0) ns=A6;
          else ns=A2;
         end
        A4:begin

          if(din==0) ns=A5;
          else ns=A2;
         end
        A5:begin

          if(din==0) ns=A1;
          else ns=A7;
         end
         A6:begin


          if(din==0) ns=A1;
          else ns=A7;
         end
         A7:begin

          if(din==0) ns=A3;
          else ns=A0;
         end
        default:ns=R;
    endcase
end
always@(ps,din)begin

	case(ps)
		A6:dout=1;
		A7:dout=1;
		default:dout=0;
	endcase
end
endmodule
