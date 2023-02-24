// Program counter
module PC (
	input            reset,
	input 			  clk, 
	input            enable,
	input            ld_pc,
	input signed[7:0]   addr_ld,
	output reg [7:0] addr
);

	always @ (posedge clk or negedge reset) begin
	
		if (reset == 1'b0)
			addr <= 8'b0;	
		else
			if (enable)
				if (ld_pc)
					addr <= addr_ld;
				else
					addr <= addr + 8'd1;
	end
	
		
		/*
		if (reset == 1'b0)
			addr <= 8'b0;
		else
			if (enable) begin
				addr <= addr + 8'd1;
			end 
		end
		*/

endmodule 