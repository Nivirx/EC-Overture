`timescale 10ns / 1ns

module TC_Universe ();
    // clock and reset signals
    reg clk;
    reg rst;

    // test data
    reg [15:0] index;
    reg [7:0] mem [0:65535];
    reg [1024*4:0] file_name;
    
    integer i;
    integer fd;

    // dut (Design Under Test) io
    reg load;
    reg save;
    wire control_in;
    reg [7:0] data_in;
    wire control_out;
    wire [7:0] data_out;

    // dut instantiation
    ECP8e dut (.clk(clk), .rst(rst),
                       .arch_output_enable(control_out), .arch_output_value(data_out),
                       .arch_input_enable(control_in), .arch_input_value(data_in));
    
    // generate clock
    initial begin
        clk = 1'b0;
        forever #1 clk = ~clk;
    end

    // generate reset
    initial begin
        rst = 1'b1;
        #5
        rst = 1'b0;
    end

    initial begin
        assign data_in = 0;
        
        i = ($value$plusargs("INPUT_FILE=%s", file_name));
        if (i != 0) begin
            i = 0;
            fd = $fopen(file_name, "r");
            while (i < 65535 && !$feof(fd)) begin
                mem[i] = $fgetc(fd);
            end
        end
    end

    always @ (posedge control_in) begin
        if (!rst) begin
            data_in <= mem[index];
            index <= index + 1;
        end
    end

    always @ (negedge clk) begin
        if (control_out && !rst) begin
            //i = $fputc(data_out, 32'h8000_0001);
            $display("received char 0x%h", data_out);
        end
        if (!control_in) begin 
            data_in <= 0;
        end
    end
endmodule
