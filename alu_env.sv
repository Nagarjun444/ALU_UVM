
class alu_env extends uvm_env;
  `uvm_component_utils(alu_env)
  
    alu_agent agnt;
	alu_scoreboard scb;
  
  function new(string name="alu_env",uvm_component parent);
     super.new(name,parent);
	 `uvm_info("ENV_CLASS","Inside constructor!",UVM_HIGH)
  endfunction
  
  //----BUILD PHASE
  function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   `uvm_info("ENV_CLASS","Build phase!",UVM_HIGH)
   agnt=alu_agent::type_id::create("agent",this);
   scb=alu_scoreboard::type_id::create("scb",this);
  endfunction
  
  //---CONNECT PHASE
  function void connect_phase(uvm_phase phase);
   super.connect_phase(phase); 
   `uvm_info("ENV_CLASS","Connect phase!",UVM_HIGH)
     agnt.mon.monitor_port.connect(scb.scoreboard_port); // .//..connection establishment between moniter to scoreboard
   endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
	
	   //logic
	
	
	
  endtask
  
  
endclass