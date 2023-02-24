module my_proc
(
   input  reset,
	input  clk,
	input [6:0] key_in,
	output [13:0] out
);
	
	wire        botao_apertado;
	wire signed [13:0] saida_ula;
	wire        [13:0] feedback_ula;
	wire			[11:0] dados;
	wire        [7:0] addr_new;

	assign botao_apertado = clk;

	
	demux dmx(op_code,acc_FB,ld_pc,write,enable,op,in);
	PC pc1(reset, clk, enable, ld_pc, addr ,addr_new);
	rom rom1(addr_new,dados);
	
	wire in ;
	wire [13:0] out_mux;
	
	wire acc_FB = feedback_ula[0];
	wire [3:0] op_code = dados[11:8];
	wire  ld_pc  ;
	wire  write ;
	wire  enable ;
	wire [2:0] op ;

	
	
	wire signed [7:0] addr = dados[7:0];
	wire signed [13:0] num;
	
	mux_key mmm(in, key_in, num,out_mux);
	RAM ram1(clk, write, feedback_ula, addr,  num);
	ULA_nova ula1(out_mux, feedback_ula, op, saida_ula);
	acumulador acu1(saida_ula, botao_apertado, reset,  feedback_ula);
	
	assign out = feedback_ula;

endmodule 