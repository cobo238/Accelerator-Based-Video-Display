module mod4tb( clock, smooth_outx, smooth_outy, col, row, red, green, blue, en, count);

	input clock;
	input       [9:0] smooth_outx, smooth_outy;
	input       [9:0] col, row;
	output reg  [3:0] red, green, blue;
	output reg  [0:0] en;
	output reg  [9:0] count;
	
	reg  [9:0] pixel_x1, pixel_x2; 
	wire [9:0] x1, x2;
	reg  [9:0] pixel_y1, pixel_y2;
	wire [9:0] y1, y2;
	reg  [7:0] addr;
	wire [11:0] colors;
							  
	ram  memory (.clock(clock), .address(addr) , .data_out(colors));
									
	assign x1 = 10'd311 + smooth_outx;
	assign x2 = 10'd326 + smooth_outx;
	assign y1 = 10'd231 + smooth_outy;
	assign y2 = 10'd246 + smooth_outy;
	
	initial begin
		count = 10'd0;
	end
	
	always @(*) begin 
			pixel_x1 = x1;
			pixel_x2 = x2;
	end
	
	always @(*) begin
	
		if (y1[9] == 1'b1) begin
			pixel_y1 = 10'd0;
			pixel_y2 = 10'd15;
		end
		else if (y2 >= 10'd479) begin
			pixel_y1 = 10'd464;
			pixel_y2 = 10'd479;
		end
		else begin
			pixel_y1 = y1;
			pixel_y2 = y2;
		end
	end
			
	always @(posedge en) begin
		count = count + 10'd1;
	end
	
	always @(*) begin

	   if ( (col[9:0] >= pixel_x1) && (col[9:0] <= pixel_x2) && (row[9:0] >= pixel_y1 ) && (row[9:0] <= pixel_y2) ) begin
			addr    = (row[9:0] - pixel_y1)*16 + (col[9:0] - pixel_x1);
			red     = colors [11:8]; 
			green   = colors [7:4];
			blue    = colors [3:0];
		end
		else begin
			if (pixel_y1 == 10'd0 || pixel_y2 == 10'd479 || pixel_x1 == 10'd55 || pixel_x2 == 10'b1000110000) begin
				red     = 4'hf;
				green   = 4'h0;
				blue    = 4'h0;
				en = 1'b1;
			end else begin
				red     = 4'h0;
				green   = 4'h0;
				blue    = 4'h0;
				en = 1'b0;
			end
		end
	end
							
endmodule
