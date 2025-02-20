# 8-bit-cpu
Building an 8-bit-cpu as a proof of concept for verilog

# Testing
## Testing CPU:
- iverilog -o tests/test_sim src/cpu.v src/control_unit.v src/alu.v src/decoder.v testbench/cpu_tb.v