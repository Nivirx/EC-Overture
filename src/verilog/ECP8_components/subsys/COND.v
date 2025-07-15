module COND (clk, rst, Condition, Input, Result);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [7:0] Condition;
  input  wire [7:0] Input;
  output  wire [0:0] Result;

  TC_Splitter8 # (.UUID(64'd1888394345583920379 ^ UUID)) Splitter8_0 (.in(wire_14), .out0(wire_5), .out1(wire_8), .out2(wire_1), .out3(), .out4(), .out5(), .out6(), .out7());
  TC_Splitter8 # (.UUID(64'd2530385753961839292 ^ UUID)) Splitter8_1 (.in(wire_17), .out0(wire_4), .out1(wire_13), .out2(wire_18), .out3(wire_3), .out4(wire_15), .out5(wire_9), .out6(wire_11), .out7(wire_0));
  TC_Nor # (.UUID(64'd1517918423970542383 ^ UUID), .BIT_WIDTH(64'd1)) Nor_2 (.in0(wire_4), .in1(wire_13), .out(wire_19));
  TC_Nor # (.UUID(64'd2736061366789794415 ^ UUID), .BIT_WIDTH(64'd1)) Nor_3 (.in0(wire_18), .in1(wire_3), .out(wire_23));
  TC_Nor # (.UUID(64'd3648822797009876962 ^ UUID), .BIT_WIDTH(64'd1)) Nor_4 (.in0(wire_15), .in1(wire_9), .out(wire_20));
  TC_Nor # (.UUID(64'd3623192028484125320 ^ UUID), .BIT_WIDTH(64'd1)) Nor_5 (.in0(wire_11), .in1(wire_0), .out(wire_21));
  TC_Nand # (.UUID(64'd1210610590039792679 ^ UUID), .BIT_WIDTH(64'd1)) Nand_6 (.in0(wire_19), .in1(wire_23), .out(wire_6));
  TC_Nand # (.UUID(64'd722301827588141756 ^ UUID), .BIT_WIDTH(64'd1)) Nand_7 (.in0(wire_20), .in1(wire_21), .out(wire_10));
  TC_Nor # (.UUID(64'd3626258032196188357 ^ UUID), .BIT_WIDTH(64'd1)) Nor_8 (.in0(wire_6), .in1(wire_10), .out(wire_16));
  TC_Switch # (.UUID(64'd2273941197800776416 ^ UUID), .BIT_WIDTH(64'd1)) Switch1_9 (.en(wire_5), .in(wire_16), .out(wire_2));
  TC_Switch # (.UUID(64'd1588245332332211989 ^ UUID), .BIT_WIDTH(64'd1)) Switch1_10 (.en(wire_8), .in(wire_0), .out(wire_22));
  TC_Or # (.UUID(64'd407901765067939990 ^ UUID), .BIT_WIDTH(64'd1)) Or_11 (.in0(wire_2), .in1(wire_22), .out(wire_7));
  TC_Xor # (.UUID(64'd4237747319249404280 ^ UUID), .BIT_WIDTH(64'd1)) Xor_12 (.in0(wire_1), .in1(wire_7), .out(wire_12));

  wire [0:0] wire_0;
  wire [0:0] wire_1;
  wire [0:0] wire_2;
  wire [0:0] wire_3;
  wire [0:0] wire_4;
  wire [0:0] wire_5;
  wire [0:0] wire_6;
  wire [0:0] wire_7;
  wire [0:0] wire_8;
  wire [0:0] wire_9;
  wire [0:0] wire_10;
  wire [0:0] wire_11;
  wire [0:0] wire_12;
  assign Result = wire_12;
  wire [0:0] wire_13;
  wire [7:0] wire_14;
  assign wire_14 = Condition;
  wire [0:0] wire_15;
  wire [0:0] wire_16;
  wire [7:0] wire_17;
  assign wire_17 = Input;
  wire [0:0] wire_18;
  wire [0:0] wire_19;
  wire [0:0] wire_20;
  wire [0:0] wire_21;
  wire [0:0] wire_22;
  wire [0:0] wire_23;

endmodule
