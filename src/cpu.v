module cpu (
    input wire clk,
    input wire rst,
    input wire [7:0] instructions [31:0],
    output reg [7:0] acc
);
    reg [7:0] reg_file [31:0];
    reg [4:0] pc;
    reg [7:0] current_instruction;
    reg hlt;

    control_unit cu_inst (
        .clk(clk),
        .current_instruction(current_instruction),
        .reg_file(reg_file),
        .hlt(hlt),
        .acc(acc),
        .alu_result(alu_result)
    );

    always @(posedge rst or posedge clk) begin
        if (rst) begin
            pc <= 5'd0;
            acc <= 8'd0;
            hlt <= 0;
        end else begin
            if (!hlt) begin
                current_instruction <= instructions[pc];
                pc <= pc + 1;
            end
        end
    end
endmodule
