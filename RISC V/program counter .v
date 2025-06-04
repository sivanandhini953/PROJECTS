module program_counter(
input clk,
input reset,
input [31:0]PC_in,
input [31:0]PC_out
);

always @(posedge clk or posedge reset)
begin
if(reset)
	PC_out <= 32'b0;
	
	else
	
	PC_out <= PC_in;
	
end
