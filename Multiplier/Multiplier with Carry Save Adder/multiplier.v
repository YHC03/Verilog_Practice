/*
 * 32-bit Multiplier with Carry Save Adder
 *
 * Function: Process Multiplication between 2 unsigned integers.
 *
 * Input: A, B (2 Operands, 32bit int)
 * Output: result(64bit int)
 *
 * Creation Date: 2024/09/24
 * Written By YHC03
*/
module multiplier(A, B, result);

    input [31:0] A;
    input [31:0] B;
    output [63:0] result;
    
    /*
     * Registers(without input and output registers)
     *
     * sum, carry: Sum and Carry of previous(and last) addition
     * operand: Operand of next addition, based on Operand A
     * result_sum, result_carry: Sum and Carry of current addition, automatically move to register sum and carry in last
     * cur: binary cursor of Operand B
    */
    reg [63:0] sum, carry, operand, result_Sum, result_Carry, result;
    reg [5:0] cur;
    
    always @(A or B) begin
        // Initialization
        sum = 0;
        carry = 0;
        result_Sum = 0;
        result_Carry = 0;
        result = 0;
        
        // Get Value of Operand A
        operand = A;
        
        // Process Carry Save Adder (32bit, 0 to 31)
        for(cur = 0; cur < 32; cur = cur + 1) begin
          
          // When Current binary location of Operand B is 1, add shifted A with previous Sum and Shifted carry
          // Else, Add previous Sum with Shifted Carry
          if(B & (1 << cur)) begin
            result_Sum = (sum ^ carry) ^ operand;
            result_Carry = (sum & carry) | (sum & operand) | (carry & operand);
          end
          else begin
            result_Sum = sum ^ carry;
            result_Carry = sum & carry;
          end
          
          // Shift Carry and Operand to do next addition
          sum = result_Sum;
          carry = (result_Carry << 1);
          operand = (operand << 1);
          
        end
        
        // Process the last calculation
        result = sum + carry;
    end
    
endmodule