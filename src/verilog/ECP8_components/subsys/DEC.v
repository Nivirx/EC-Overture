module DEC (clk, rst, Instruction, IMM_EN, ALU_EN, COPY_EN, BRANCH_EN);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [7:0] Instruction;
  output  wire [0:0] IMM_EN;
  output  wire [0:0] ALU_EN;
  output  wire [0:0] COPY_EN;
  output  wire [0:0] BRANCH_EN;

  TC_Decoder2 # (.UUID(64'd954500439059266356 ^ UUID)) Decoder2_0 (.sel0(wire_6), .sel1(wire_1), .out0(wire_2), .out1(wire_3), .out2(wire_5), .out3(wire_0));
  TC_Splitter8 # (.UUID(64'd2677939290028462653 ^ UUID)) Splitter8_1 (.in(wire_4), .out0(), .out1(), .out2(), .out3(), .out4(), .out5(), .out6(wire_6), .out7(wire_1));

  wire [0:0] wire_0;
  assign BRANCH_EN = wire_0;
  wire [0:0] wire_1;
  wire [0:0] wire_2;
  assign IMM_EN = wire_2;
  wire [0:0] wire_3;
  assign ALU_EN = wire_3;
  wire [7:0] wire_4;
  assign wire_4 = Instruction;
  wire [0:0] wire_5;
  assign COPY_EN = wire_5;
  wire [0:0] wire_6;

endmodule
