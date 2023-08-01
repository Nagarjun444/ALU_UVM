//object class



class alu_sequence_item extends uvm_sequence_item;


  rand logic reset;
  rand logic [7:0] a,b;
  rand logic [3:0] op_code;
       logic [7:0] result; //output
       bit carry_out; //output 

`uvm_object_utils(alu_sequence_item)


//constraints 

   constraint c1 {a inside {[10:20]};}
   constraint c2 {b inside {[0:10]};}
   constraint c3 {op_code inside {0,1,2,3};}


//instantiation 
function new(string name ="alu_sequence_item");
 super.new(name);
endfunction






endclass