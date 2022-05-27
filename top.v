module top(

	input 		          		MAX10_CLK1_50,
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,
	input 		     [1:0]		KEY,
	output		     [9:0]		LEDR,
	input 		     [9:0]		SW,
	output		reg  [3:0]		VGA_B,
	output		reg  [3:0]		VGA_G,
	output		reg          	VGA_HS,
	output		reg  [3:0]		VGA_R,
	output		reg          	VGA_VS,
	output		          		GSENSOR_CS_N,
	input 		     [2:1]		GSENSOR_INT,
	output		          		GSENSOR_SCLK,
	inout 		          		GSENSOR_SDI,
	inout 		          		GSENSOR_SDO
);
	assign HEX5 = 8'b1111_1111; assign HEX4 = 8'b1111_1111;
	
	wire [0:0]  data_update;
	wire [15:0] data_x, data_y;
	wire [32:0] smooth_outx, smooth_outy;
	
	reg  [9:0] pixel_x1, pixel_x2; 
	wire [9:0] x1, x2;
	reg  [9:0] pixel_y1, pixel_y2;
	wire [9:0] y1, y2;
	reg  [7:0] addr;
	wire [11:0] colors;
	reg  [0:0] en;
	reg  [9:0] count;
	
	// Signals for drawing to the display. 
	wire [31:0]  col, row;
	reg  [3:0]   red, green, blue;

	// Timing signals - don't touch these.
	wire  h_sync, v_sync;
	wire  disp_ena;

	pll	pll_inst (
	.inclk0 ( MAX10_CLK1_50 ),
	.c0 ( c0_sig ), //25MHz
	.c1 ( c1_sig ), //2MHz
	.c2 ( c2_sig )  //2MHz w/ 270 phase shift
	);

	spi_control gsensor (.reset_n(KEY[0]), .clk(c0_sig), .spi_clk(c1_sig),
                     	.spi_clk_out(c2_sig), .data_update(data_update), 
								.data_x(data_x), .data_y(data_y), .SPI_SDI(GSENSOR_SDI), 
								.SPI_SDO(GSENSOR_SDO), .SPI_CSN(GSENSOR_CS_N), 
								.SPI_CLK(GSENSOR_SCLK), .interrupt());
								
	smoothFilter x_axis (.clock(c0_sig), .enable(VGA_HS), .select(SW[1:0]), .data_x(data_x), 
	                     .data_update(data_update), .smooth_out(smooth_outx));
						  
	smoothFilter y_axis (.clock(c0_sig), .enable(VGA_VS), .select(SW[1:0]), .data_x(data_y), 
	                     .data_update(data_update), .smooth_out(smooth_outy));
						  
	BCDconvert BCD_x (.bin(count), .nothing(), .sign(HEX3), 
	                  .hunBCD(HEX2), .tenBCD(HEX1), .oneBCD(HEX0));
							  
   // Register VGA output signals for timing purposes
	always @(posedge c0_sig) begin
		if (disp_ena == 1'b1) begin
			VGA_R <= red;
			VGA_B <= blue;
			VGA_G <= green;
		end else begin
			VGA_R <= 4'd0;
			VGA_B <= 4'd0;
			VGA_G <= 4'd0;
		end
		VGA_HS <= h_sync;
		VGA_VS <= v_sync;
	end
	
	vga_controller control (.pixel_clk(c0_sig), .reset_n(KEY[0]), .h_sync (h_sync),
                           .v_sync(v_sync), .disp_ena(disp_ena), .column(col), .row(row));
	
	ram  memory (.clock(c0_sig), .address(addr) , .data_out(colors));
									
	assign x1 = 10'd311 + smooth_outx[9:0];
	assign x2 = 10'd326 + smooth_outx[9:0];
	assign y1 = 10'd231 + smooth_outy[9:0];
	assign y2 = 10'd246 + smooth_outy[9:0];
		
	//x is already saturated.
	always @(*) begin 
		pixel_x1 = x1;
		pixel_x2 = x2;
	end
	//y saturation
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
	//drawing picture
	always @(*) begin

	   if ( (col[9:0] >= pixel_x1) && (col[9:0] <= pixel_x2) && (row[9:0] >= pixel_y1 ) && (row[9:0] <= pixel_y2) ) begin
			addr    = (row[9:0] - pixel_y1)*16 + (col[9:0] - pixel_x1);
			red     = colors [11:8]; 
			green   = colors [7:4];
			blue    = colors [3:0];
		end
		else begin                                                                            //-464
			if (pixel_y1 == 10'd0 || pixel_y2 == 10'd479 || pixel_x1 == 10'd55 || pixel_x2 == 10'b1000110000) begin
				red     = 4'hf; //all red
				green   = 4'h0;
				blue    = 4'h0;
				en = 1'b1;
			end else begin
				red     = 4'h0; //all black
				green   = 4'h0;
				blue    = 4'h0;
				en = 1'b0;
			end
		end
	end
							
endmodule
