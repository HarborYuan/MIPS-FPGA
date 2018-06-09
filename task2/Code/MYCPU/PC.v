module PcUnit(PC,PcReSet,NPCOp,clk,Adress);

	input   PcReSet;
	input   clk;
	input   [31:0] Adress;
	input   [1:0]NPCOp;
	
	output reg[31:0] PC;
	
	integer i;
	reg [31:0] temp;
	
	always@(negedge clk or posedge PcReSet)
	begin
		if (PcReSet)
			PC = 32'h00000000;
		else if (NPCOp == 2'b00)	
			PC = PC+4;
	  	else if(NPCOp== 2'b10)
			PC = {PC[31:28],Adress[25:0],2'b00};
		else if (NPCOp==2'b01)
			PC = Adress;
	end
endmodule