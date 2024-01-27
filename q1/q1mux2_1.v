module mux2_1(
enable,i1,i0,s,y
    );
    input enable;
    input i1;
    input i0;
    input s;
    output reg y;
    
 always@(*)
 begin
    if(enable) 
    begin
    if(s) y=i1;
    else y=i0;
    end
 end   
    
 endmodule
