vlog testbench.sv +incdir+C:/questasim_10.4e/verilog_src/uvm-1.1d/src
vsim -novopt work.top -sv_lib C:/questasim_10.4e/uvm-1.1d/win32/uvm_dpi

toggle report -all

add wave -position insertpoint sim:dut
run -all
