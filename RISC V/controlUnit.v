module control_unit(
input [6:0]instruction,
output reg branch,
output reg MemRread,
output reg memtoreg,
output reg MemWrite,
output reg [1:0]ALUOp,
output reg ALUSrc,
output reg RegWrite
);
always @(*)
begin	
	case(instruction)
	 7'b0110011 : {ALUSrc,memtoreg,RegWrite,MemRread,MemWrite,branch,ALUOp} <= 8'b001000_10;
	 7'b0000011 : {ALUSrc,memtoreg,RegWrite,MemRread,MemWrite,branch,ALUOp} <= 8'b111100_00;
	 7'b0100011 : {ALUSrc,memtoreg,RegWrite,MemRread,MemWrite,branch,ALUOp} <= 8'b100010_00;
	 7'b1100011 : {ALUSrc,memtoreg,RegWrite,MemRread,MemWrite,branch,ALUOp} <= 8'b000001_01;
	 endcase
	 end
	 
	 endmodule
