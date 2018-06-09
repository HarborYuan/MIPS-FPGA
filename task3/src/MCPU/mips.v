module mips(clk,rst,inst_in,Data_in,mem_w,PC_out,Addr_out,Data_out,INT,asd);
    input clk;
    input rst;
	 input [31:0]inst_in;
	 input [31:0]Data_in;
	 output mem_w;
	 output [31:0]PC_out;
	 output [31:0]Addr_out;
	 output [31:0]Data_out;
	 output [31:0]asd;
	 input INT;
	
	 
    
    wire [31:0] PCnex;
    wire [31:0] PC;
    wire PCin;
    PCUnit my_pc(PCnex,PC,clk,PCin,rst);
    
    wire [31:0] im_out;
    wire [31:0] ALUout_out;
    wire [3:0] be;
    wire [31:0] B_out;
    wire DMWr;
    wire [31:0] dm_out;
    wire [31:0] MDR_in;
    wire IRWr;
    wire [31:0]Instruction;
    wire [31:0] MDR_out;
	 
    //im_4k my_im (PC[11:2],im_out);
	 assign PC_out = PC;
	 assign im_out = inst_in;
    //dm_4k my_dm (ALUout_out[11:2],be,B_out,DMWr,clk,dm_out);
	 assign Addr_out = ALUout_out;
	 //be not used;
	 assign Data_out = B_out;
	 assign mem_w = DMWr;
	 assign dm_out = Data_in;
	 
    flopr #(32) IR(clk, IRWr, im_out,Instruction);
    flopr #(32) MDR(clk, 1, MDR_in, MDR_out);

    wire [1:0]RegWAd;
    wire [1:0]RegWDa;
    wire [4:0] Write_Addr;
    wire [31:0] Write_Data;
    mux #(4,2,5) WR_Ad_Sel(RegWAd,Write_Addr,Instruction[20:16],Instruction[15:11],5'b11111);
    mux #(4,2,32) WR_D_Sel(RegWDa,Write_Data,ALUout_out,MDR_out,PC);

    wire RFWr;
    wire [31:0] Read_Data1;
    wire [31:0] Read_Data2;
    wire [31:0] A_out;
    RF my_RF(Instruction[25:21],Instruction[20:16],Write_Addr,Write_Data,RFWr,clk,Read_Data1,Read_Data2,rst,asd);
    flopr #(32) A(clk,1,Read_Data1,A_out);
    flopr #(32) B(clk,1,Read_Data2,B_out);

    wire [1:0]ALUSrcA;
    wire [2:0] ALUSrcB;
    wire [31:0] ALU_A;
    wire [31:0] ALU_B;
    wire [31:0] ALU_C;
    wire [31:0] SE_out;
    wire [31:0] UE_out;
    wire Zero;
    wire A_First;
    wire A_Zero;
    wire [3:0] ALUOp;
    mux #(4,2,32) ALUAmux(ALUSrcA,ALU_A,PC,A_out,{27'b0,Instruction[10:6]});
    mux #(8,3,32) ALUBmux(ALUSrcB,ALU_B,B_out,32'd4,SE_out,{SE_out,2'b0},UE_out);
    ALU my_alu(ALU_C,Zero,ALU_A,ALU_B,ALUOp,A_First,A_Zero);
    flopr #(32) ALUout(clk,1,ALU_C,ALUout_out);

    wire [1:0] PCSource;
    mux #(4,2,32) PCsel(PCSource,PCnex,ALU_C,ALUout_out,{PC[31:28],Instruction[25:0],2'b0});
    SE my_SE(Instruction[15:0],SE_out);
    UE my_UE(Instruction[15:0],UE_out);

    wire PCWrite;
    wire PCWriteCond;
    wire BFlag;
    ctrl my_ctrl(clk, Instruction, IRWr, RegWAd, DMWr, PCWrite, PCWriteCond, 
PCSource, ALUOp, ALUSrcA, ALUSrcB, RFWr, RegWDa, rst);

    BEUnit my_BEUnit(ALUout_out[1:0],Instruction[31:26],be);
    LHandle my_LHandle(Instruction[31:26],ALUout_out[1:0],dm_out,MDR_in);
    B my_B(A_First,A_Zero,Zero,BFlag,Instruction[31:26],Instruction[20:16]);
    assign PCin = (PCWrite) || (PCWriteCond&&BFlag);
endmodule
