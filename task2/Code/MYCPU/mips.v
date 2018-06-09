module mips(clk,reset,PC_out,Instruction_in,DMWr,addr,din,dout,INT,CPU_MIO,MIO_ready);
    input wire INT;
    output[31:0] CPU_MIO;
    input wire MIO_ready;
	 input reset; 


    wire [4:0]Read_Addr_1; 
    wire [4:0]Read_Addr_2; 
    wire [4:0]Write_Addr;
    wire [31:0]Write_Data;
    wire RFWr;
    input clk;
    wire [31:0]Read_Data_1;
    wire [31:0]Read_Data_2;
    RF RegisteFile(Read_Addr_1, Read_Addr_2, Write_Addr,Write_Data, RFWr, clk, Read_Data_1, Read_Data_2, reset, CPU_MIO);
    
    wire [31:0]ALU_A;
    wire [31:0]ALU_B;
    wire Zero;
    wire [2:0]ALUOp;
    wire [31:0]ALU_C;
    alu AALLUU(ALU_C, Zero, ALU_A, ALU_B, ALUOp);
    
    input wire [31:0]Instruction_in;
	 wire [31:0]Instruction;
    wire [31:0] Read_Address;
	 
	 flopr my_inst(.clk(clk), .rst(reset), .d(Instruction_in), .q(Instruction));
    //IM InstructionMemory(Instruction, Read_Address);

    output wire [31:0]PC_out;
    wire [31:0]Adress;
    wire [1:0] NPCOp;
    PcUnit pppccc(PC_out, reset,NPCOp, clk, Adress);

    wire [15:0]Imm16;
    wire [1:0]EXTOp; 
    wire [31:0]Imm32;
    EXT eexxtt(Imm16, EXTOp, Imm32);

    input wire [31:0]dout;
    output wire [31:0]addr;
    output wire [31:0]din;
    output wire DMWr;
    //DM DataMemory(dout,addr,din,DMWr,clk);

    wire [31:0]adder;
    addpc addppcc(PC_out,Imm32,adder);

    wire Bsel;
    mux ALUsec(Bsel,ALU_B,Read_Data_2,Imm32);

    wire [1:0]WDSel;
    mux #(4,2,32) RFWsec(WDSel,Write_Data,ALU_C,dout,PC_out);
    
    wire [1:0]GPRSel;
    mux #(4,2,5) RFWAsec(GPRSel,Write_Addr,Instruction[15:11],Instruction[20:16],5'b11111);

    //wire [1:0]NPCOp;
    mux #(4,2,32) PCsssel(NPCOp,Adress,32'b0,adder,{6'b0,Instruction[25:0]});

    wire rst,IRWr,PCWr;
    ctrl Control(clk, rst, Instruction[31:26], Instruction[5:0], Zero, Bsel, WDSel, RFWr, DMWr, NPCOp, EXTOp, ALUOp,PCWr, IRWr, GPRSel);



    assign Read_Addr_1 = Instruction[25:21];
    assign Read_Addr_2 = Instruction[20:16];
    assign ALU_A = Read_Data_1;
    assign din = Read_Data_2;
    assign addr = ALU_C;
    assign Read_Address = PC_out;
    assign Imm16 = Instruction[15:0];
endmodule