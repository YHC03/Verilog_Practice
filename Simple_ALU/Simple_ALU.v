/*
 * Simple ALU
 *
 * (Ports)
 * Input: A, B(Operands), cmd(Command)
 * Output: X, Y(Results)
 *
 * (ALU Commands)
 * 000 No Operation. X = A; Y = B;
 * 001 Addition. X = A + B; Y = 0;
 * 010 Subtraction. X = A - B; Y = 0;
 * 011 Shift Left(Logical). X = (A << B) | (A >> (63 - B)); Y = 0;
 * 100 Shift Right(Logical). X = (A >> B) | (A << (63 - B)); Y = 0;
 * 101 AND. X = A & B; Y = ~(A & B);
 * 110 OR. X = A | B; Y = ~(A | B);
 * 111 XOR. X = A ^ B; Y = ~(A ^ B);
 *
 * Written by: YHC03
 * Last Modified Date: 2024/10/05
*/

module Simple_ALU(A, B, cmd, X, Y);
  // Set Parameter of ALU Commands
  parameter ALU_NOP = 3'b000;
  parameter ALU_ADD = 3'b001;
  parameter ALU_SUB = 3'b010;
  parameter ALU_SLL = 3'b011;
  parameter ALU_SLR = 3'b100;
  parameter ALU_AND = 3'b101;
  parameter ALU_OR = 3'b110;
  parameter ALU_XOR = 3'b111;
  
  input [63:0] A, B;
  input [2:0] cmd;
  output [63:0] X, Y;
  reg [63:0] X, Y;
  
  always @(A or B or cmd) begin
	 case(cmd)
	 ALU_NOP: begin X <= A; Y = B; end
	 ALU_ADD: begin X <= A + B; Y = 0; end
	 ALU_SUB: begin X <= A - B; Y = 0; end
	 ALU_SLL: begin X <= (A << B) | (A >> (63 - B)); Y = 0; end
	 ALU_SLR: begin X <= (A >> B) | (A << (63 - B)); Y = 0; end
	 ALU_AND: begin X <= A & B; Y = ~(A & B); end
	 ALU_OR: begin X <= A | B; Y = ~(A | B); end
	 ALU_XOR: begin X <= A ^ B; Y = ~(A ^ B); end
	 endcase

  end

endmodule