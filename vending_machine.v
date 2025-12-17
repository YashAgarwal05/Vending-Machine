module vending_machine(input [1:0]coin ,input clk,reset,
output reg out,output reg [1:0] state,newstate);
parameter A=0,B=1,C=2,D=3;
always@(*)begin

case(state)
A:begin
    if(coin==2'b00)
        newstate=A;
    else if(coin==2'b01)
          newstate=B;
     else if(coin==2'b10)
            newstate=C;
      else
        newstate=A;
     end
 B: begin
    if(coin==2'b00)
        newstate=B;
    else if(coin==2'b01)
          newstate=C;
     else if(coin==2'b10)
            newstate=D;
      else
        newstate=A;
     end
 C:newstate=C;
 D:newstate=D;
 endcase
 end
 always@(posedge clk,posedge reset)begin
    if(reset)begin
    state<=0;
    
    end
    else
    state<=newstate;
    end
    always@(*)begin
     if((state==D)|| (state==C))//use next statement to faster this
        out=1;
     else
        out=0;
     end
    endmodule