module alu (
    input wire [2:0] alu_opcode,
    input wire [7:0] operand,
    input wire [7:0] acc_in,
    output reg [7:0] acc_out
);
    always @(*) begin
        case (alu_opcode)
            3'b011: acc_out = acc_in + operand;
            3'b100: acc_out = acc_in - operand;
            default: acc_out = acc_in;
        endcase
    end
endmodule
/*
module demux_2to4 (
    input wire in,
    input wire [1:0] sel,
    output reg [3:0] out
);
    always @(*) begin // trigger on change
        out = 4'b0000;
        case (sel) // {} used for merging bits
            2'b00: out = {3'b000, in};
            2'b01: out = {2'b00, in, 1'b0};
            2'b10: out = {1'b0, in, 2'b00};
            2'b11: out = {in, 3'b000};
            default: out = 4'b0000;
        endcase
    end
endmodule
*/