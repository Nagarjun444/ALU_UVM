
class alu_driver extends uvm_driver#(alu_sequence_item);
  `uvm_component_utils(alu_driver)
  alu_sequence_item item;   //sequence item class
  virtual alu_interface vif;
  
  function new(string name="alu_driver",uvm_component parent);
    begin
     super.new(name,parent);
	 `uvm_info("DRIVER_CLASS","Inside constructor!",UVM_HIGH)
	 end
  endfunction
  
  //---BUILD PHASE
  function void build_phase(uvm_phase phase);
       super.build_phase(phase);
      `uvm_info("DRIVER_CLASS","Build phase!",UVM_HIGH)
        if(!(uvm_config_db #(virtual alu_interface)::get(this,"*","vif",vif)))
		  begin
	      `uvm_error("DRIVER_CLASS","failed to get VIF from calling DBI")
		  end
  endfunction
  
  //---CONNECT PHASE
  function void connect_phase(uvm_phase phase);
    begin
   super.connect_phase(phase);
   `uvm_info("DRIVER_CLASS","Connect phase!",UVM_HIGH)
   end
  endfunction
  
  
  //--RUN PHASE
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
	`uvm_info("DRIVER_CLASS","Inside run phase!",UVM_HIGH)
	   //logic 
	   forever 
	    begin
		  item = alu_sequence_item::type_id::create("item");
		  seq_item_port.get_next_item(item);
		    drive(item);
			seq_item_port.item_done();
		end
	
	
  endtask
  
  task drive(alu_sequence_item item);
     @(posedge vif.clock)
	   vif.reset   <=item.reset;
	   vif.a       <=item.a;
	   vif.b       <=item.b;
	   vif.op_code <=item.op_code;
	   
  endtask
  
  
  
endclass