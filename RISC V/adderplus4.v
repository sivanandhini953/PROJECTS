module PCplus4(
input [31:0]fromPC,
output [31:0]NexttoPC
);

assign NexttoPC = fromPC + 4;
endmodule
