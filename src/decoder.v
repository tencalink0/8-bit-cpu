module decoder (
    input wire [7:0] instruction,
    output reg [2:0] alu_opcode,
    output reg [4:0] reg_source
);
    always @(*) begin
        alu_opcode = instruction[7:5];
        reg_source = instruction[4:0];
    end
endmodule