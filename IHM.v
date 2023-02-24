// A entrada Ã© de um nÃºmero com 14 bits e um bit de sinal
// Esse mÃ³dulo jÃ¡ mostra o LED de sinal e o nÃºmero no display
module interface(   
	input signed [13:0] in,
	output sig,										// Bit de sinal
	output a0, b0, c0, d0, e0, f0, g0,     // Segmentos da tela
	output a1, b1, c1, d1, e1, f1, g1,
	output a2, b2, c2, d2, e2, f2, g2, 
	output a3, b3, c3, d3, e3, f3, g3
);

	wire [13:0] num_sem_sinal;
	wire [3:0]  algarismo1;
	wire [3:0]  algarismo2;
	wire [3:0]  algarismo3;
	wire [3:0]  algarismo4;

	MUX mux1(in, num_sem_sinal, sig);
	
	dec9999(num_sem_sinal, 
		algarismo1, algarismo2, algarismo3, algarismo4);

	my_BCD(algarismo4,
		a0, b0, c0, d0, e0, f0, g0
	);
	my_BCD(algarismo3,
		a1, b1, c1, d1, e1, f1, g1
	);
	my_BCD(algarismo2,
		a2, b2, c2, d2, e2, f2, g2
	);
	my_BCD(algarismo1,
		a3, b3, c3, d3, e3, f3, g3
	);

endmodule