module instruction_mem(

input clk,
input reset,
input [31:0]read_address,
output [31:0]instruction_out
);


reg [31:0] ins_mem [64:0];
integer k;

always @(posedge clk or posedge reset)begin
if(reset)

for (k=0;k<64;k=k+1)
ins_mem[k]=32'b0;

else instruction_out <= ins_mem[read_address];
end
endmodule
