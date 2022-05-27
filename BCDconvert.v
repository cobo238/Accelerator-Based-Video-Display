module BCDconvert (bin, nothing, sign, hunBCD, tenBCD, oneBCD);
	
	input [9:0] bin;
	input [0:0] nothing;
	output reg [7:0] hunBCD, tenBCD, oneBCD;
	output reg [7:0] sign;
	
	wire [21:0] word;
	reg [21:0] bin2shift;
	reg [9:0] posbin;
	reg [3:0] hun, ten, one;
	wire [7:0] hunD, tenD, oneD;
	
	assign word = {4'b0000, 4'b0000, 4'b0000, posbin};
	
	seg7 a0 (.in(one), .out(oneD));
	seg7 a1 (.in(ten), .out(tenD));
	seg7 a2 (.in(hun), .out(hunD));

	always @(*) begin
	
		if (! nothing) begin
	
			if (bin[9] == 1'b1) begin
				sign = 8'b10111111;
				posbin = -bin;
			end else begin
				posbin = bin;
				sign = 8'd255;
			end
			
			bin2shift = word;
			
			//1st shift
			if (bin2shift[21:18] >= 4'd5) 
				bin2shift[21:18] = bin2shift[21:18] + 4'd3;
			if (bin2shift[17:14] >= 4'd5)
				bin2shift[17:14] = bin2shift[17:14] + 4'd3;
			if (bin2shift[13:10] >= 4'd5)
				bin2shift[13:10] = bin2shift[13:10] + 4'd3;
			bin2shift = bin2shift << 1;
			
			//2nd shift
			if (bin2shift[21:18] >= 4'd5) 
				bin2shift[21:18] = bin2shift[21:18] + 4'd3;
			if (bin2shift[17:14] >= 4'd5)
				bin2shift[17:14] = bin2shift[17:14] + 4'd3;
			if (bin2shift[13:10] >= 4'd5)
				bin2shift[13:10] = bin2shift[13:10] + 4'd3;
			bin2shift = bin2shift << 1;
			
			//3rd shift
			if (bin2shift[21:18] >= 4'd5) 
				bin2shift[21:18] = bin2shift[21:18] + 4'd3;
			if (bin2shift[17:14] >= 4'd5)
				bin2shift[17:14] = bin2shift[17:14] + 4'd3;
			if (bin2shift[13:10] >= 4'd5)
				bin2shift[13:10] = bin2shift[13:10] + 4'd3;
			bin2shift = bin2shift << 1;
			
			//4th shift
			if (bin2shift[21:18] >= 4'd5) 
				bin2shift[21:18] = bin2shift[21:18] + 4'd3;
			if (bin2shift[17:14] >= 4'd5)
				bin2shift[17:14] = bin2shift[17:14] + 4'd3;
			if (bin2shift[13:10] >= 4'd5)
				bin2shift[13:10] = bin2shift[13:10] + 4'd3;
			bin2shift = bin2shift << 1;
			
			//5th shift
			if (bin2shift[21:18] >= 4'd5) 
				bin2shift[21:18] = bin2shift[21:18] + 4'd3;
			if (bin2shift[17:14] >= 4'd5)
				bin2shift[17:14] = bin2shift[17:14] + 4'd3;
			if (bin2shift[13:10] >= 4'd5)
				bin2shift[13:10] = bin2shift[13:10] + 4'd3;
			bin2shift = bin2shift << 1;
			
			//6th shift
			if (bin2shift[21:18] >= 4'd5) 
				bin2shift[21:18] = bin2shift[21:18] + 4'd3;
			if (bin2shift[17:14] >= 4'd5)
				bin2shift[17:14] = bin2shift[17:14] + 4'd3;
			if (bin2shift[13:10] >= 4'd5)
				bin2shift[13:10] = bin2shift[13:10] + 4'd3;
			bin2shift = bin2shift << 1;
			
			//7th shift
			if (bin2shift[21:18] >= 4'd5) 
				bin2shift[21:18] = bin2shift[21:18] + 4'd3;
			if (bin2shift[17:14] >= 4'd5)
				bin2shift[17:14] = bin2shift[17:14] + 4'd3;
			if (bin2shift[13:10] >= 4'd5)
				bin2shift[13:10] = bin2shift[13:10] + 4'd3;
			bin2shift = bin2shift << 1;
			
			//8th shift
			if (bin2shift[21:18] >= 4'd5) 
				bin2shift[21:18] = bin2shift[21:18] + 4'd3;
			if (bin2shift[17:14] >= 4'd5)
				bin2shift[17:14] = bin2shift[17:14] + 4'd3;
			if (bin2shift[13:10] >= 4'd5)
				bin2shift[13:10] = bin2shift[13:10] + 4'd3;
			bin2shift = bin2shift << 1;
			
			//9th shift
			if (bin2shift[21:18] >= 4'd5) 
				bin2shift[21:18] = bin2shift[21:18] + 4'd3;
			if (bin2shift[17:14] >= 4'd5)
				bin2shift[17:14] = bin2shift[17:14] + 4'd3;
			if (bin2shift[13:10] >= 4'd5)
				bin2shift[13:10] = bin2shift[13:10] + 4'd3;
			bin2shift = bin2shift << 1;
			
			//10th shift
			if (bin2shift[21:18] >= 4'd5) 
				bin2shift[21:18] = bin2shift[21:18] + 4'd3;
			if (bin2shift[17:14] >= 4'd5)
				bin2shift[17:14] = bin2shift[17:14] + 4'd3;
			if (bin2shift[13:10] >= 4'd5)
				bin2shift[13:10] = bin2shift[13:10] + 4'd3;
			bin2shift = bin2shift << 1;
			
			one = bin2shift[13:10];
			ten = bin2shift[17:14];
			hun = bin2shift[21:18];
			
			hunBCD = hunD;
			tenBCD = tenD;
			oneBCD = oneD;
		end

		else begin
			 sign = 8'b10111111;
			 hunBCD = 8'b10111111;
			 tenBCD = 8'b10111111;
			 oneBCD = 8'b10111111;
	   end
		
	end

endmodule


	