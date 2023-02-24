module ULA_nova
(
	input signed      [13:0] in1,
	input signed      [13:0] in2,   	// A realimentacao precisa ser de 14 bits
												//	devido a multiplicacao por 100
	input             [2:0] op,		// Operacao
	output reg signed [13:0] out		// Resultado
);

	always @ (*) begin
		case (op)
			// Os numeros agora ja vem com ganho 100, que devera ser desfeito
			// na multiplicacao e divisao
			// 0 0 0 - soma
			// 0 0 1 - subtracao
			// 0 1 0 - multiplicacao
			//	0 1 1 - divisao	
			//	1 0 0 - LOAD | Repete in1	
			//	1 0 1 - SET  | Repete in2
			//	1 1 0 - EQU  | Operador de comparacao de igualdade
			3'b000: out <= (in2 + in1); 
			3'b001: out <= (in2 - in1); 
			3'b010: out <= (in2 * in1) / 100; 
			3'b011: out <= in2 * 100 / in1; 
			3'b100: out <= in1;
			3'b101: out <= in2;
			3'b110: out <= (in1 == in2);
			
			default:
				out <= 14'dx;
		
		endcase 
	end

endmodule
