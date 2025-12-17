module vending_tb();
reg clk,reset;
reg [1:0]coin;
wire out;
wire [1:0] state,newstate;
vending_machine uut(.clk(clk),.reset(reset),.out(out),
.coin(coin),.state(state),.newstate(newstate));
initial clk=0;
always #5 clk=~clk;
initial begin
reset =1;coin=2'b00;
#10 reset=0;
#10coin=2'b01;
#10;coin=2'b10;
#10 reset=1;coin=2'b00;
#10 reset=0;coin=2;
#10 reset=1;coin=0;
#10 reset=0;coin=1;
#10 reset=0;coin=1;
#50
$finish;
end
endmodule
//10 sec tak 10 the usme uske baad zero ho gye nhi to aase 5 mr out 1 as next cycle coin 5 hi dikha okk

