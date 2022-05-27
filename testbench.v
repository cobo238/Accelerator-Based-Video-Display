module testbench;

	reg  clk;
	reg  [9:0] data_x, data_y, col, row;
	wire [3:0] red, green, blue;
	wire enable;
	wire [9:0] count;
	

	mod4tb UUT (.clock(clk), .smooth_outx(data_x), .smooth_outy(data_y), .col(col), 
	            .row(row), .red(red), .green(green), .blue(blue), .en(enable), .count(count));
					
	initial begin
		clk = 1;
		forever #50 clk = ~clk;
	end
	
	initial begin
	s
		//center
		col = 10'd314;
		row = 10'd234;
		data_x = 10'd0;
		data_y = 10'd0;
		#100;
		col = 10'd327;
		row = 10'd234;
		#100;
		col = 10'd314;
		row = 10'd234;
		data_x = 10'd0;
		data_y = 10'd0;
		#100;
		col = 10'd327;
		row = 10'd234;
		#100;
		
		col = 10'd169;
		row = 10'd139;
		data_x = 10'b1101101010; //-150
		data_y = 10'b1110011100; //-100
		#100;
		col = 10'd314;
		row = 10'd234;
		#100;
		//top sat
		col = 10'd314;
		row = 10'd8;
		data_x = 10'd0;
		data_y = 10'b1011111100; //-260
		#100;
		col = 10'd314;
		row = 10'd234;
		#100;
		//center
		col = 10'd314;
		row = 10'd234;
		data_x = 10'd0;
		data_y = 10'd0;
		#100;
		col = 10'd327;
		row = 10'd234;
		#100;	
		$stop; 
	end

endmodule
