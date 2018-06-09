module RF(A1, A2, A3, WD, RFWr, clk, RD1, RD2,rst,asd);
  input [4:0]A1;
  input [4:0]A2;
  input [4:0]A3;
  input [31:0]WD;
  input RFWr;
  input clk;
  input rst;
  output reg [31:0]RD1;
  output reg [31:0]RD2;
  output [31:0]asd;
  
  reg[5:0] i;
  
  reg [31:0] data[31:0];
  

  
  always @(A1 or A2 or data[A1] or data[A2])
  begin
    RD1<=data[A1];
    RD2<=data[A2];
  end
  
  always @(negedge clk or posedge rst)
  begin
  if (rst)
  begin
		for (i=0;i<32;i=i+1)
			data[i]=32'b0;
    //data[28]=32'h00001800;
    //data[29]=32'h00002ffe;
  end
  else if (RFWr&&A3!=0)
    data[A3]=WD;
  end
  
  assign asd = data[10];
endmodule
