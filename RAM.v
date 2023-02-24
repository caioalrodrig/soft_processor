module RAM (
	input 				clk,
	input             write,
	input		  [13:0] dado_in,
	input      [7:0] addr,
	output reg [13:0] data
);
	// 256 elementos de 14 bits
	reg[13:0] ram[255:0];
	
	// Inicializacao da memoria
	initial begin 
		ram[0] = {14'd100};  
		ram[1] = {14'd100}; 
		ram[3] = {14'd100};
	end

	always @ (*)
		data <= ram[addr];
		
	always @ (posedge clk)
		if (write) 
			ram[addr] <= dado_in;		
	
endmodule