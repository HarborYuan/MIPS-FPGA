`include "./alu_def.v"
module ctrl(clk, instruction, IRWr, RegWAd, DMWr, PCWrite, PCWriteCond, 
PCSource, ALUOp, ALUSrcA, ALUSrcB, RFWr, RegWDa,
rst
);
    input clk;
    input [31:0] instruction;
    output reg IRWr;
    output reg [1:0]RegWAd;
    output reg DMWr;
    output reg PCWrite;
    output reg PCWriteCond;
    output reg [1:0] PCSource;
    output reg [3:0] ALUOp;
    output reg [1:0] ALUSrcA;
    output reg [2:0] ALUSrcB;
    output reg RFWr;
    output reg [1:0]RegWDa;
	input rst;
    integer i;

    always @(posedge clk or posedge rst)
    begin
			if (rst)
				i=0;
        else case (i)
        0:i=1;
        1:i=2;
        2:case(instruction[31:26])
                6'h0,6'h8,6'h9,6'ha,6'hb,6'hc,6'hd,6'he,6'hf:i = 3;
                6'h28,6'h29,6'h2b,6'h20,6'h21,6'h23,6'h24,6'h25:i=5;
                6'h4,6'h5,6'h6,6'h7,6'h1:i=9;
                6'h2,6'h3:i=10;
            endcase
        3:case(instruction[5:0])
                6'h8,6'h9:if(instruction[31:26]==0)i=11;else i=4;
                default:i=4;
            endcase
        4:i=1;
        5:case(instruction[31:26])
            6'h28,6'h29,6'h2b:i=6;
            6'h20,6'h21,6'h23,6'h24,6'h25:i=7;
            endcase
        6:i=1;
        7:i=8;
        8:i=1;
        9:i=1;
        10:i=1;
        11:i=1;
        endcase
    end


    always @(negedge clk)
    begin
        case (i)
        0:begin
            PCWrite <= 0;
            IRWr <=0;
            DMWr <=0;
            RFWr <=0;
            PCWriteCond <= 0;
            end
        1:begin
            RFWr <= 0;
            IRWr <= 1;
            DMWr <= 0;
            PCWriteCond <= 0;
            ALUSrcA <= 0;
            ALUSrcB <= 1;
            PCSource <= 0;
            ALUOp <= `ALU_ADD;
            PCWrite <= 1;
            end
        2:begin
            ALUSrcA <= 0;
            ALUSrcB <= 3;
            ALUOp <= `ALU_ADD;
            PCWriteCond <= 0;
            IRWr <= 0;
            RFWr <=0;
            PCWrite <= 0;
            DMWr <=0;
            end
        3:begin
            IRWr <= 0;
            RFWr <=0;
            PCWrite <= 0;
            DMWr <=0;
            if ((instruction[5:0]==6'h0 || instruction[5:0]==6'h2 || instruction[5:0]==6'h3)&&instruction[31:26]==0)
                ALUSrcA <= 2;
            else
                ALUSrcA <= 1;
            if (instruction[31:26]==0)
                ALUSrcB <= 0;
            else
                case(instruction[5:0])
                    6'hc,6'hd,6'he,6'hf,6'hb:ALUSrcB<=4;
                    default:ALUSrcB<=2;
                endcase
            PCWriteCond <= 0;
            case(instruction[31:26])
            6'h0:
            case(instruction[5:0])
                6'h20,6'h8,6'h9:ALUOp <= `ALU_ADD;
                6'h21:ALUOp <= `ALU_ADD;
                6'h22:ALUOp <= `ALU_SUB;
                6'h23:ALUOp <= `ALU_SUB;
                6'h0 :ALUOp <= `ALU_SLL;
                6'h2 :ALUOp <= `ALU_SRL;
                6'h3 :ALUOp <= `ALU_SRA;
                6'h4 :ALUOp <= `ALU_SLL;
                6'h6 :ALUOp <= `ALU_SRL;
                6'h7 :ALUOp <= `ALU_SRA;
                6'h24:ALUOp <= `ALU_AND;
                6'h25:ALUOp <= `ALU_OR;
                6'h26:ALUOp <= `ALU_XOR;
                6'h27:ALUOp <= `ALU_NOR;
                6'h2a:ALUOp <= `ALU_SLT;
                6'h2b:ALUOp <= `ALU_SLTU;
                default:ALUOp <= `ALU_NOP;
            endcase
            6'h8:ALUOp <= `ALU_ADD;
            6'h9:ALUOp <= `ALU_ADD;
            6'hc:ALUOp <= `ALU_AND;
            6'hd:ALUOp <= `ALU_OR;
            6'he:ALUOp <= `ALU_XOR;
            6'hf:ALUOp <= `ALU_LUI;
            6'ha:ALUOp <= `ALU_SLT;
            6'hb:ALUOp <= `ALU_SLTU;
            endcase
            end
        4:begin
            IRWr <= 0;
            PCWrite <= 0;
            DMWr <=0;
            RegWDa <= 0;
            if (instruction[31:26]==0)
                RegWAd <= 1;
            else
                RegWAd <= 0;
            RFWr <= 1;
            PCWriteCond <= 0;
            end
        5:begin
            IRWr <= 0;
            PCWrite <= 0;
            DMWr <=0;
            RegWDa <= 0;
            PCWriteCond <= 0;
            RFWr <=0;
            ALUOp <= `ALU_ADD;
            ALUSrcA <= 1;
            ALUSrcB <= 2;
            end
        6:begin
            DMWr<=1;
            IRWr <= 0;
            PCWrite <= 0;
            RegWDa <= 0;
            PCWriteCond <= 0;
            RFWr <=0;
            end
        7:begin
            IRWr <= 0;
            PCWrite <= 0;
            DMWr <=0;
            RegWDa <= 0;
            PCWriteCond <= 0;
            RFWr <=0;
            end
        8:begin
            IRWr <= 0;
            PCWrite <= 0;
            DMWr <=0;
            RegWDa <= 0;
            PCWriteCond <= 0;
            RegWDa <= 1;
            RegWAd <= 0;
            RFWr <=1;
            end
        9:begin
            IRWr <= 0;
            PCWrite <= 0;
            DMWr <=0;
            RFWr <=0;
            PCWriteCond <= 1;
            ALUSrcA<=1;
            ALUSrcB<=0;
            ALUOp<=`ALU_SUB;
            PCSource<=1;
            end
        10:begin
            PCSource <=2;
            PCWrite <= 1;
            IRWr <= 0;
            DMWr <=0;
            PCWriteCond <= 0;
            if(instruction[31:26]==2)
                begin
                    RFWr <=0;
                end
            else if (instruction[31:26]==3)
                begin
                    RFWr <=1;
                    RegWAd <= 2;
                    RegWDa <= 2;
                end
            end
        11:begin
            PCSource <=0;
            PCWrite <= 1;
            IRWr <= 0;
            DMWr <=0;
            PCWriteCond <= 0;
            case(instruction[5:0])
                6'h8:RFWr <=0;
                6'h9:begin
                        RFWr <=1;
                        RegWAd <= 1;
                        RegWDa <= 2;
                    end
            endcase
            end
        endcase
    end
endmodule