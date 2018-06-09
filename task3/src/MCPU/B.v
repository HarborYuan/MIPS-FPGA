module B(A_First,A_Zero,Zero,BFlag,instr,addr);
    input A_First;
    input A_Zero;
    input Zero;
    output reg BFlag;
    input [31:26]instr;
    input [4:0]addr;

    always@(*)
    begin
        case(instr)
            4:BFlag <= Zero;
            5:BFlag <= ~Zero;
            6:BFlag <= A_First||A_Zero;
            7:BFlag <= (~A_First)&&(~A_Zero);
            1:if (addr==5'b1)
                BFlag <= ~A_First;
                else
                BFlag <= A_First;
        endcase
    end
endmodule