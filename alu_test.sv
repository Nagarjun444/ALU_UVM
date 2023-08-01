
class alu_test extends uvm_test;
  `uvm_component_utils(alu_test)
  
  alu_env env; //component class
   alu_base_sequence  reset_seq; //sequence class
   alu_test_sequence  test_seq;  //sequencee class 2
   
  function new(string name="alu_test",uvm_component parent);
     super.new(name,parent);
	 `uvm_info("TEST_CLASS","Inside constructor!",UVM_HIGH)
  endfunction
   //---BUILD PHASE
  function void build_phase(uvm_phase phase);
        super.build_phase(phase);
       `uvm_info("TEST_CLASS","Build phase!",UVM_HIGH)
        env=alu_env::type_id::create("env",this);	//component class
  endfunction
  
  //---CONNECT PHASE
  function void connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   `uvm_info("TEST_CLASS","Connect phase!",UVM_HIGH)
    //connect moniter with scroboard
	
   
  endfunction
  //----RUN PHASE
  task run_phase(uvm_phase phase);
   begin
    super.run_phase(phase);
	`uvm_info("TEST_CLASS","RUN phase!",UVM_HIGH)
	
	   //logic
	     phase.raise_objection(this);	 
		  //start sequence
		    //reset sequence 
			 reset_seq=alu_base_sequence::type_id::create("reset_seq");	
              reset_seq.start(env.agnt.seqr);
              #10;

               repeat(100)
                begin			   
			     //test seqr
			     test_seq=alu_test_sequence::type_id::create("test_seq");	
                 test_seq.start(env.agnt.seqr);		
                  #10;
                end			   
		        phase.drop_objection(this);
	     
	end
  endtask
  
  
endclass