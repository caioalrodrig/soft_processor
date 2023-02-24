// Separa um numero ate 9999 em seus 4 algarismos
// correspondentes em cada saída
module dec9999(
	input      [13:0] in,
	output reg [3:0]  out1,
	output reg [3:0]  out2,
	output reg [3:0]  out3,
	output reg [3:0]  out4
);

	always @ (*) begin
		out1 <= in / 1000;   
		out2 <= (in % 1000) / 100;	
		out3 <= (in % 100) / 10;	
		out4 <= (in % 10) ;
	end
	
endmodule 
