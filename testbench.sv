
 `timescale 1ns/1ns
 import uvm_pkg::*;
 `include "uvm_macros.svh"

///include files
`include "alu_dut.sv"
`include "interface.sv"
`include "alu_sequence_item.sv"
`include "alu_sequence.sv"
`include "alu_sequencer.sv"
`include "alu_driver.sv"
`include "alu_moniter.sv"
`include "alu_agent.sv"
`include "alu_scoreboard.sv"
`include "alu_env.sv"
`include "alu_test.sv"






module top;


  //instantiation
   
   logic clock=0;
   
   alu_interface intf(.clock(clock));
   
   alu dut (.clock(intf.clock),
            .reset(intf.reset),
            .A(intf.a),
            .B(intf.b),
            .ALU_Sel(intf.op_code),
            .ALU_Out(result),
            .CarryOut(carry_out)	  
   );
   
   //interface setting 
    initial 
	  begin
	    uvm_config_db #(virtual alu_interface)::set(null,"*","vif",intf);
	  end
   
   
   
   initial
     begin
	   run_test("alu_test");
	 end
   
   
   initial
     begin
	   forever
	     begin
	   #200
  	   clock=~clock ;
	   end
	 end
	 
	 initial
	   begin
	     #50000;
		  $display("simulation stoped");
		  $finish;
	   end
	   
	   
	   initial
	     begin
		    $dumpfile("dump.vcd");
			$dumpvars();
		 end


endmodule