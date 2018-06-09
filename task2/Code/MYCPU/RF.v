module RF(A1, A2, A3, WD, RFWr, clk, RD1, RD2, rst, asd);
  input [4:0]A1;
  input [4:0]A2;
  input [4:0]A3;
  input [31:0]WD;
  input RFWr;
  input clk;
  input rst;
  output reg [31:0]RD1;
  output reg [31:0]RD2;
  reg[5:0] i;
  reg [31:0] data [0:31];
  output wire [31:0] asd;
  
  always @(A1 or A2 or data[RD1] or data[RD2])
  begin
    RD1<=data[A1];
    RD2<=data[A2];
  end
  
  always @(posedge clk or  posedge rst)
  begin
  
  if (rst)
  begin
  for (i=0;i<32;i=i+1)
      data[i]=32'b0;
  end
  
  else if (RFWr)
  begin
    data[A3]=WD;
	end
	end
/*	
	always @(WD or A3 or rst)
	begin
	if (rst)
		begin
		for (i=0;i<32;i=i+1)
			data[i]<=32'b0;
		end
		else if (RFWr)
		begin
			data[A3]<=WD;
		end
	end
	*/
	assign asd = data[17] + 32'h00000020;
	//{data[17][15:0],data[9][15:0]};
endmodule
