module Data_Memory(
input clk,reset,
input MemWrite,
input MemRread,
input [31:0]read_address,
input [31:0]write_data,
output [31:0]MemData_out
);
reg [31:0]D_Memory[63:0];
integer k;

always @(posedge clk or posedge reset)
begin
if(reset)
begin

for(k=0;k<64;k=k+1)
begin
D_Memory[k] <= 31'b00;
end
else if(MemWrite) begin

D_Memory[read_address] <= write_data;
end

assign MemData_out = MemRread ? D_Memory[read_address] : 32'b00;

endmodule
