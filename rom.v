module rom (
	input [7:0] addr,
	output reg [11:0] data
);

	reg [11:0] rom[255:0];
	initial begin
		// Programa do prof. Dado x e y, confere se y e zero. Se nao for, faz x/y
		rom[0] = {4'd12, 8'd2}; // in  num
		rom[1] = {4'd1, 8'd2};  // save buff "num -1"
		rom[2] = {4'd6, 8'd0};	// cmp  ==1 ?
		rom[3] = {4'd9, 8'd10};	// if yes    jump para 11
		rom[4] = {4'd0, 8'd2};  // ld  buff "num -1"
		rom[5] = {4'd4, 8'd3};  // mult
		rom[6] = {4'd1, 8'd3};  //save buff
		
		rom[7] = {4'd0, 8'd2};	//load buff "num -1 "
	   rom[8] = {4'd3, 8'd1};  // sub num -1
		rom[9] = {4'd7, 8'd1};  // volta pra linha 2
		rom[10]=  {4'd0, 8'd3};
		rom[11] = {4'd10, 8'dx};

	end
	
	always @(*) begin
		data <= rom[addr];
	end

endmodule
