module top(
input clk,
input reset,
);
wire [31:0]PC_top,instruction_top,Rd1_top ,Rd2_top,immext_top,Mux1_top,sum_out_top;
wire [31:0] NexttoPC_top,address_top,Memdata_top,MemWrite_top,WriteBack_top;

wire RegWrite_top,ALUSrc_top,branch_top,zero_top,memtoreg_top,MemRread_top,sel2_top;
wire [1:0]ALUOp_top,PCin_top;
wire [3:0]control_top;
//program counter
 program_counter pc( .clk(clk), .reset(reset), .PC_in(PCin_top), .PC_out(PC_top));
 
 // adder+4
 PCplus4 pcadd(.fromPC(PC_top), .NexttoPC(NexttoPC_top));
 
 //instruction Memory
 instruction_mem ins_mem(.clk(clk), .reset(reset), .read_address(PC_top), .instruction_out(instruction_top));
 
	
//register file

reg_file reg_f(.clk(clk), .reset(reset), .RegWrite(RegWrite_top), .read_reg1(instruction_top[19:15]), .read_reg2(instruction_top[24:20]), .read(instruction_top[11:7]),.write_data(WriteBack_top),.read_data1(Rd1_top),.read_data2(Rd2_top));

//immediate generator

immgen ig(.opcode(instruction_top[6:0]),.instruction(instruction_top),.immext(immext_top) );

//control_unit 

control_unit cu(.instruction(instruction_top[6:0]),.branch(branch_top),.MemRread(MemRread_top),.memtoreg(memtoreg_top),.ALUOp(ALUOp_top),.MemWrite(MemWrite_top),.ALUSrc(ALUSrc_top),.RegWrite(RegWrite_top));

// ALU control


ALU_control AC(.fun7(instruction_top[30]),.fun3(instruction_top[14:12]),.ALUOp(ALUOp_top),.control_out(control_top)); 

// ALU

ALU_unit ALU(.A(Rd1_top),.B(Mux1_top),.contorl_in(control_top),.ALU_result(address_top),.zero(zero_top));

//ALU Mux1

Mux1 M1(.sel1(ALUSrc_top),.A1(Rd2_top),.B1(immext_top),.Mux1_out(Mux1_top));

Mux2 M2(.sel2(sel2_top),.A2(NexttoPC_top),.B2(sum_out_top),.Mux2_out(PCin_top));

Mux3 M3(.sel3(memtoreg_top),.A3(address_top),.B3(Memdata_top),.Mux3_out(WriteBack_top));

 
//adder

adder add(.in_1(PC_top),.in_2(immext_top),.sum_out(sum_out_top));


// AND gate

AND_gate an(.branch(branch_top),.zero(zero_top),.and_out(sel2_top));


// data Memory
 
 Data_Memory D_m(.clk(clk),.reset(reset),.MemWrite(MemWrite_top),.MemRread(MemRread_top),.read_address(address_top),.write_data(Rd2_top),.MemData_out(Memdata_top));
 
 
 endmodule
