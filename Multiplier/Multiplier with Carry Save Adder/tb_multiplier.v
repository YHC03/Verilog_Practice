`timescale 1ns/1ps

/*
 * Testbench file for 32-bit Multiplier with Carry Save Adder
 *
 * Creation Date: 2024/09/24
 * Written By YHC03
*/

module tb_multiplier;
  reg [31:0] A;
  reg [31:0] B;
  wire [63:0] result;
  
  multiplier multiplier1(A, B, result);
  
  // Simulation Begin
  initial begin
    // 10 * 30 = 300
    A <= 10;
    B = 30;
    #100;
    
    // 2000 * 1250 = 2500000
    A <= 2000;
    B = 1250;
    #100;
    
    // Finalize
    A<=0;
    B=1;
    $finish;
  end
  
endmodule;