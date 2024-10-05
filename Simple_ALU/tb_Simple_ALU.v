`timescale 1ns/1ps

/*
 * Testbench for Simple ALU
 *
 * Last Modified Date: 2024/10/05
 * Written By: YHC03
*/

module tb_Simple_ALU();
  // Set Parameter of ALU Commands
  parameter ALU_NOP = 3'b000;
  parameter ALU_ADD = 3'b001;
  parameter ALU_SUB = 3'b010;
  parameter ALU_SLL = 3'b011;
  parameter ALU_SLR = 3'b100;
  parameter ALU_AND = 3'b101;
  parameter ALU_OR = 3'b110;
  parameter ALU_XOR = 3'b111;
  
  reg [63:0] A, B;
  reg [2:0] cmd;
  wire [63:0] X, Y;
  
  Simple_ALU ALU1(A, B, cmd, X, Y);
  
  // Simulation Starts
  initial begin
    A <= 0; B <= 0; cmd = ALU_NOP;
    #10
    
    A <= 10; B <= 30; cmd = ALU_ADD;
    #10
    
    A <= 80; B <= 160; cmd = ALU_SUB;
    #10
    
    A <= 2; B <= 5; cmd = ALU_SLL;
    #10
    
    A <= 15; B <= 3; cmd = ALU_SLR;
    #10
    
    A <= 36; B <= 20; cmd = ALU_AND;
    #10
    
    A <= 31; B <= 32; cmd = ALU_OR;
    #10
    
    A <= 255; B <= 126; cmd = ALU_XOR;
    #10
    
    $exit;
    
  end
  
endmodule