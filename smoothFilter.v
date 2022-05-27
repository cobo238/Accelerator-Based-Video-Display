module smoothFilter (clock, enable, select, data_x, data_update, smooth_out);
	
	input clock;
	input enable;
	input [1:0] select;
	input [15:0] data_x;
	input [0:0] data_update;
	output reg [32:0] smooth_out;
	reg [32:0] sum;
	reg [255:0] shiftreg, shiftreg_c;
	
	always @(posedge clock) begin
		//register that stores 16 data_x's
		shiftreg <= #1 shiftreg_c;
	end
	
	
	always @(*) begin
	   if (data_update) begin
			//shifting old data and storing new data
			shiftreg_c = (shiftreg << 16) + {240'd0, data_x}; 
		end
		else begin
			shiftreg_c = shiftreg;
		end
	end
	
	always @(*) begin
		if (enable == 1'b0) begin
			case (select) 
				2'b00: smooth_out = shiftreg[15:0]; 
				2'b01: begin 
					sum = shiftreg[15:0] + shiftreg[31:16];
					smooth_out = sum >> 1; end
				2'b10: begin
					sum = shiftreg[15:0] + shiftreg[31:16] + shiftreg[47:32] + shiftreg[63:48];
					smooth_out = sum >> 2; end
				2'b11: begin
					sum = shiftreg[15:0] + shiftreg[31:16] + shiftreg[47:32] + shiftreg[63:48]
							+ shiftreg[79:64] + shiftreg[95:80] + shiftreg[111:96] + shiftreg[127:112]
							+ shiftreg[143:128] + shiftreg[159:144] + shiftreg[175:160] + shiftreg[191:176]
							+ shiftreg[207:192] + shiftreg[223:208] + shiftreg[239:224] + shiftreg[255:240];
					smooth_out = sum >> 4; end
			endcase
		end
	
	end
endmodule
	