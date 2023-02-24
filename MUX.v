// Tem como entrada um numero e coloca na saida o numero
// sem sinal e um bit de sinal
module MUX (
	input signed  [13:0] in,
	output reg    [13:0] out,
	output reg           sig
);

	always @(*)
	begin

	// O bit de sinal esta na posição 13
	if(in[13])
		begin
			out <= -in;
			sig <= 1;
		end
	else
		begin
			out <= in;
			sig <= 0;
		end
	end
	
endmodule 