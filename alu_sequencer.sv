
class alu_sequencer extends uvm_sequencer#(alu_sequence_item);
  `uvm_component_utils(alu_sequencer) 
  function new(string name="alu_sequencer",uvm_component parent);
    begin
     super.new(name,parent);
	 `uvm_info("SEQUNCER_CLASS","Inside constructor!",UVM_HIGH)
	 end
  endfunction
  //--Build PHASE
  function void build_phase(uvm_phase phase);
    begin
   super.build_phase(phase);
   `uvm_info("SEQUENCER_CLASS","Build phase!",UVM_HIGH)
   end
  endfunction
  
  //----CONNECT PHASE
  function void connect_phase(uvm_phase phase);
    begin
   super.connect_phase(phase);
   `uvm_info("SEQUENCER_CLASS","Connect phase!",UVM_HIGH)
   end
  endfunction
  
   
  
  
endclass