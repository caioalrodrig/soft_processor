module mux_key(
	
	input k,
	input [6:0] num_in ,
	input [13:0] ram,
	output reg [13:0] num_out

);
always@(*) begin
if (k)
	num_out=num_in*100;
else	
	num_out=ram;
end	
endmodule