module ALU_unit(
input [31:0]A,
input [31:0]B,
input [3:0]contorl_in,
output reg ALU_result,
output reg zero
);

always @(*)
begin	
		case(contorl_in)
		4'b0000:begin zero <= 0;ALU_result <= A&B; end
		4'b0001:begin zero <= 0;ALU_result <= A|B; end
		4'b0010:begin zero <= 0;ALU_result <= A+B; end
		4'b0110:begin if(A==B)zero <= 1 else zero <= 0 ;ALU_result <= A-B; end
		endcase
		
		end
		endmodule
