module Mux1(
input sel1;
input A1,
input B1,
output [31:0]Mux1_out
);
assign Mux1_out = sel1 ? A1:B1;
endmodule


module Mux2(
input sel2;
input A2,
input B2,
output [31:0]Mux2_out
);
assign Mux2_out = sel2 ? A2:B2;
endmodule


module Mux3(
input sel3;
input A3,
input B3,
output [31:0]Mux3_out
);
assign Mux3_out = sel3 ? A3:B3;
endmodule
