/*class alu_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(alu_scoreboard)
  
  
  uvm_analysis_imp #(alu_sequence_item.alu_scoreboard) scoreboard_port;  //alu moniter to scrboard recive
  
  alu_sequence_item transactions[$];
  
  function new(string name="alu_scoreboard",uvm_component parent);
    begin
     super.new(name,parent);
	 `uvm_info("SCOREBOARD_CLASS","Inside constructor!",UVM_HIGH)
	 end
  endfunction
  
  //---BUILD PHASE
  function void build_phase(uvm_phase phase);
       super.build_phase(phase);
      `uvm_info("SCOREBOARD_CLASS","Build phase!",UVM_HIGH)
        
		scoreboard_port=new("scoreboard_port",this);
		
  endfunction
  
  //---CONNECT PHASE
  function void connect_phase(uvm_phase phase);
    begin
   super.connect_phase(phase);
   `uvm_info("SCOREBOARD_CLASS","Connect phase!",UVM_HIGH)
   end
  endfunction
  
  //write method
  
  function write(alu_sequence_item item);
    
     transactions.push_back(item);
  endfunction
  
  
  
  //--RUN PHASE
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
	`uvm_info("SCOREBOARD_CLASS","Inside run phase!",UVM_HIGH)
	   forever
	    begin
		  //get the packet 
		  //generate the packet value
		  //compare with actual data
		  // score the transactions accordingly
		  alu_sequence_item curr_trans;
		  wait((transactions.size()!=0));
		  curr_trans  = transactions.pop_front;
		  
		  compare(curr_trans);
		  
		end
	
	
  endtask
  
  //----compare:generate expected result and compare with actual 
  
  
  task compare(alu_sequence_item curr_trans)
  logic [7:0] expected;
  logic [7:0] actual;
   
   case (curr_trans.opcode)
     0:begin expected=curr_trans.a+curr_trans.b;end
	 1:begin expected=curr_trans.a-curr_trans.b;end
	 2:begin expected=curr_trans.a*curr_trans.b;end
	 3:begin expected=curr_trans.a/curr_trans.b;end 
   endcase
  
  actual=curr_trans.result;
  
  if(actual!=expected)
   begin
     `uvm_error("compare",$sformat("Transaction failed! ACT=%d,EXP=%0d",actual,expected));
   end
  else
    begin
	  `uvm_info("compare",$sformat("transaction passed! ACT=%0d,Exp=%0d",actual,expected),UVM_LOW);
	end
  
  endtask
  
  
  
  endclass*/
  
  
  
  

class alu_scoreboard extends uvm_test;
  `uvm_component_utils(alu_scoreboard)
  
  uvm_analysis_imp #(alu_sequence_item, alu_scoreboard) scoreboard_port;
  
  alu_sequence_item transactions[$];
  
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "alu_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("SCB_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SCB_CLASS", "Build Phase!", UVM_HIGH)
   
    scoreboard_port = new("scoreboard_port", this);
    
  endfunction: build_phase
  
  
  //--------------------------------------------------------
  //Connect Phase
  //--------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SCB_CLASS", "Connect Phase!", UVM_HIGH)
    
   
  endfunction: connect_phase
  
  
  //--------------------------------------------------------
  //Write Method
  //--------------------------------------------------------
  function void write(alu_sequence_item item);
    transactions.push_back(item);
  endfunction: write 
  
  
  
  //--------------------------------------------------------
  //Run Phase
  //--------------------------------------------------------
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SCB_CLASS", "Run Phase!", UVM_HIGH)
   
    forever begin
      /*
      // get the packet
      // generate expected value
      // compare it with actual value
      // score the transactions accordingly
      */
      alu_sequence_item curr_trans;
      wait((transactions.size() != 0));
      curr_trans = transactions.pop_front();
      compare(curr_trans);
      
    end
    
  endtask: run_phase
  
  
  //--------------------------------------------------------
  //Compare : Generate Expected Result and Compare with Actual
  //--------------------------------------------------------
  task compare(alu_sequence_item curr_trans);
    logic [7:0] expected;
    logic [7:0] actual;
    
    case(curr_trans.op_code)
      0: begin //A + B
        expected = curr_trans.a + curr_trans.b;
      end
      1: begin //A - B
        expected = curr_trans.a - curr_trans.b;
      end
      2: begin //A * B
        expected = curr_trans.a * curr_trans.b;
      end
      3: begin //A / B
        expected = curr_trans.a / curr_trans.b;
      end
    endcase
    
    actual = curr_trans.result;
    
    if(actual != expected) begin
      `uvm_error("COMPARE", $sformatf("Transaction failed! ACT=%d, EXP=%d", actual, expected))
    end
    else begin
      // Note: Can display the input and op_code as well if you want to see what's happening
      `uvm_info("COMPARE", $sformatf("Transaction Passed! ACT=%d, EXP=%d", actual, expected), UVM_LOW)
    end
    
  endtask: compare
  
  
endclass: alu_scoreboard