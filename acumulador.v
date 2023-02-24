// Repete o sinal da entrada na saída no pulso de clock
module acumulador
(
	input  signed     [13:0] d,            // Entrada
	input                    clk,          // Clock
	input                    reset,
   output reg signed [13:0] q = 14'd0    // Saída
);

always @ (posedge clk or negedge reset) begin
		if (reset == 1'b0)
		   q <= 14'd0;
		else 
			q <= d;
end
	
endmodule