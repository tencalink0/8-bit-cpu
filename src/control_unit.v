module control_unit(
    input wire clk,
    input wire [7:0] current_instruction,
    input wire [7:0] reg_file [31:0],
    output reg hlt,
    output reg [7:0] acc,
    output wire [7:0] alu_result // Output from ALU
);
    reg [2:0] alu_opcode;
    reg [4:0] reg_source;

    alu alu_inst (
        .alu_opcode(alu_opcode),
        .operand(reg_file[reg_source]),
        .acc_in(acc),
        .acc_out(alu_result)
    );

    decoder decoder_inst (
        .instruction(current_instruction),
        .alu_opcode(alu_opcode),
        .reg_source(reg_source)
    );

    always @(posedge clk) begin
        case (alu_opcode)
            3'b000: hlt <= 1;
            3'b011: acc <= alu_result;
            3'b100: acc <= alu_result;
            default: acc <= acc;
        endcase
    end
endmodule