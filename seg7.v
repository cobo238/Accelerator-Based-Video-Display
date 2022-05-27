module seg7 (in,out);

	input wire [3:0] in;
	
	output reg [7:0] out;
	
	wire [1:0] wire_part;

	reg [5:0] reg_part;

	assign wire_part[1] = 1;//turns off decimal(i think)

	assign wire_part[0] = (in[3]&in[2]&(~in[1])&(~in[0])) | ((~in[3])&in[2]&in[1]&in[0]) | ((~in[3])&(~in[2])&(~in[1]));

	always @ (in[3:0]) begin

		case ({in[3],in[2],in[1],in[0]})
		
			4'b0000: begin
				reg_part = 6'b000000;
				out = {wire_part,reg_part};
			end
			
			4'b0001: begin
				reg_part = 6'b111001;
				out = {wire_part,reg_part};
			end
			
			4'b0010: begin
				reg_part = 6'b100100;
				out = {wire_part,reg_part};
			end
			
			4'b0011: begin
				reg_part = 6'b110000;
				out = {wire_part,reg_part};
			end
			
			4'b0100: begin
				reg_part = 6'b011001;
				out = {wire_part,reg_part};
			end
			
			4'b0101: begin
				reg_part = 6'b010010;
				out = {wire_part,reg_part};
			end
			
			4'b0110: begin
				reg_part = 6'b000010;
				out = {wire_part,reg_part};
			end
			
			4'b0111: begin
				reg_part = 6'b111000;
				out = {wire_part,reg_part};
			end
			
			4'b1000: begin
				reg_part = 6'b000000;
				out = {wire_part,reg_part};
			end
			
			4'b1001: begin
				reg_part = 6'b011000;
				out = {wire_part,reg_part};
			end
			
			4'b1010: begin
				reg_part = 6'b001000;
				out = {wire_part,reg_part};
			end
			
			4'b1011: begin
				reg_part = 6'b000011;
				out = {wire_part,reg_part};
			end
			
			4'b1100: begin
				reg_part = 6'b000110;
				out = {wire_part,reg_part};
			end
			
			4'b1101: begin
				reg_part = 6'b100001;
				out = {wire_part,reg_part};
			end
			
			4'b1110: begin
				reg_part = 6'b000110;
				out = {wire_part,reg_part};
			end
			
			4'b1111: begin
				reg_part = 6'b001110;
				out = {wire_part,reg_part};
			end
		endcase
	end

endmodule


	
	