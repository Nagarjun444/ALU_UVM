module alu(clock,reset,A,B,ALU_Sel,ALU_Out,CarryOut);
input clock;
input reset;
input [7:0]A;
input [7:0]B;
input [3:0]ALU_Sel;
output reg [7:0]ALU_Out;
output reg CarryOut;

always@(posedge clock ,posedge reset)
begin
 if(reset==1)
   begin
     ALU_Out<=8'b0;
	 CarryOut<=1'b0;
   end
 else
   begin
     $display("alu select=%0d",ALU_Sel);
     casez(ALU_Sel)
	   
	   4'b0000:ALU_Out<=A+B;
	   4'b0001:ALU_Out<=A-B;
	   4'b0010:ALU_Out<=A*B;
	   4'b0011:ALU_Out<=A/B;
	   4'b0zzz:ALU_Out<=ALU_Out;
  
	 endcase
   end
end
endmodule