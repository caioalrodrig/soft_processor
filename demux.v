module demux(
	input [3:0] opcode, 
	input acc_FB,
	output reg pc_LD, write, enable,
	output reg [2:0] op,
	output reg in
);

	always @ (*) begin
	  case (opcode)
		 4'd0: begin //LOAD
			pc_LD <= 1'b0;
			write    <= 1'b0;
			enable    <= 1'b1;
			op    <= 3'd4;
			in    <= 1'b0;
		 end
		 4'd1: begin //SET
			pc_LD <= 1'b0;
			write    <= 1'b1;
			enable    <= 1'b1;
			op    <= 3'd5;
			in    <= 1'b0;
		 end
		 4'd2: begin //ADD
			pc_LD <= 1'b0;
			write    <= 1'b0;
			enable    <= 1'b1;
			op    <= 3'd0;
			in    <= 1'b0;
		 end
		 4'd3: begin //SUB
			pc_LD <= 1'b0;
			write    <= 1'b0;
			enable    <= 1'b1;
			op    <= 3'd1;
			in    <= 1'b0;
		 end
		 4'd4: begin //MULT
			pc_LD <= 1'b0;
			write    <= 1'b0;
			enable    <= 1'b1;
			op    <= 3'd2;
			in    <= 1'b0;
		 end
		 4'd5: begin //DIV
			pc_LD <= 1'b0;
			write    <= 1'b0;
			enable    <= 1'b1;
			op    <= 3'd3;
			in    <= 1'b0;
		 end
		 4'd6: begin //EQU
			pc_LD <= 1'b0;
			write    <= 1'b0;
			enable    <= 1'b1;
			op    <= 3'd6;
			in    <= 1'b0;
		 end
		 4'd7: begin //JMP
			pc_LD <= 1'b1;
			write    <= 1'b0;
			enable    <= 1'b1;
			op    <= 3'd5;
			in    <= 1'b0;
		 end
		 4'd8: begin //JNZ
			pc_LD <= ~acc_FB;
			write    <= 1'b0;
			enable    <= 1'b1;
			op    <= 3'd5;
			in    <= 1'b0;
		 end
		 4'd9: begin //JZ
			pc_LD <= acc_FB;
			write    <= 1'b0;
			enable    <= 1'b1;
			op    <= 3'd5;
			in    <= 1'b0;
		 end
		 4'd10: begin //STOP
			pc_LD <= 1'b0;
			write    <= 1'b0;
			enable    <= 1'b0;
			op    <= 3'd5;
			in    <= 1'b0;
		 end
		 4'd11: begin //NOP
			pc_LD <= 1'b0;
			write    <= 1'b0;
			enable    <= 1'b1;
			op    <= 3'd5;
			in    <= 1'b0;
		 end
		  4'd12: begin //in
			pc_LD <= 1'b0;
			write    <= 1'b0;
			enable    <= 1'b1;
			op    <= 3'd4;
			in    <= 1'b1;
		 end
		 default: begin
			pc_LD <= 1'bx;
			write    <= 1'bx;
			enable    <= 1'bx;
			op    <= 3'dx;	
			in    <= 1'bx;		
		 end
	  endcase
	end
	
endmodule 