module alu_tb;
    reg in;
    reg [1:0] sel;
    wire [3:0] out;

    demux_2to4 uut(
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $monitor("Time=%0t | sel=%b | out=%b", $time, sel, out);
        in = 1;

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;
        $finish;
    end
endmodule