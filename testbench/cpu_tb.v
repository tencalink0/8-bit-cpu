module cpu_tb;
    // Testbench signals
    reg clk;
    reg rst;
    reg [7:0] instructions [31:0];
    wire [7:0] acc;

    // Instantiate the CPU
    cpu uut (
        .clk(clk),
        .rst(rst),
        .instructions(instructions),
        .acc(acc)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        rst = 0;
        instructions[0] = 8'b00000000; // Halt
        instructions[1] = 8'b01100001; // Add to acc
        instructions[2] = 8'b10000001; // Subtract from acc
        instructions[3] = 8'b00000000; // Halt

        rst = 1; #10;
        rst = 0; #10;

        $display("Starting test...");
        #100;
        $display("Accumulator value: %d", acc);

        if (acc == 8'b00000001) begin
            $display("Test passed!");
        end else begin
            $display("Test failed!");
        end

        $finish;
    end
endmodule