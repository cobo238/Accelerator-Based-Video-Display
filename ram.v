module ram( clock, address, data_out);

	input clock;
	input [7:0] address; //8 bits to represent 256 words.
	output reg [11:0] data_out;
	
	reg [11:0] mem[255:0];
	
	initial begin
		//RGB
		mem[0]    = 12'b0010_0100_0111;
		mem[1]    = 12'b0010_0100_0111;
		mem[2]    = 12'b0010_0100_0111;
		mem[3]    = 12'b0010_0100_0111;
		mem[4]    = 12'b0010_0100_0111;
		mem[5]    = 12'b0010_0100_0111;
		mem[6]    = 12'b0010_0100_0111;
		mem[7]    = 12'b0010_0100_0111;
		mem[8]    = 12'b0010_0100_0111;
		mem[9]    = 12'b0010_0100_0111;
		mem[10]    = 12'b0010_0100_0111;
		mem[11]    = 12'b0010_0100_0111;
		mem[12]    = 12'b0010_0100_0111;
		mem[13]    = 12'b0010_0100_0111;
		mem[14]    = 12'b0010_0100_0111;
		mem[15]    = 12'b0010_0100_0111;
		mem[16]    = 12'b0010_0100_0111;
		mem[17]    = 12'b0010_0100_0111;
		mem[18]    = 12'b0010_0100_0111;
		mem[19]    = 12'b0010_0100_0111;
		mem[20]    = 12'b0010_0100_0111;
		mem[21]    = 12'b0010_0100_0111;
		mem[22]    = 12'b0010_0100_0111;
		mem[23]    = 12'b0010_0100_0111;
		mem[24]    = 12'b0010_0100_0111;
		mem[25]    = 12'b0010_0100_0111;
		mem[26]    = 12'b0010_0100_0111;
		mem[27]    = 12'b0010_0100_0111;
		mem[28]    = 12'b0010_0100_0111;
		mem[29]    = 12'b0010_0100_0111;
		mem[30]    = 12'b0010_0100_0111;
		mem[31]    = 12'b0010_0100_0111;
		mem[32]    = 12'b0010_0100_0111;
		mem[33]    = 12'b0010_0100_0111;
		mem[34]    = 12'b0010_0100_0111;
		mem[35]    = 12'b0010_0100_0111;
		mem[36]    = 12'b0010_0100_0111;
		mem[37]    = 12'b0010_0100_0111;
		mem[38]    = 12'b0010_0100_0111;
		mem[39]    = 12'b0010_0100_0111;
		mem[40]    = 12'b0010_0100_0111;
		mem[41]    = 12'b0010_0100_0111;
		mem[42]    = 12'b0010_0100_0111;
		mem[43]    = 12'b0010_0100_0111;
		mem[44]    = 12'b0010_0100_0111;
		mem[45]    = 12'b0010_0100_0111;
		mem[46]    = 12'b0010_0100_0111;
		mem[47]    = 12'b0010_0100_0111;
		mem[48]    = 12'b0010_0100_0111;
		mem[49]    = 12'b0010_0100_0111;
		mem[50]    = 12'b0010_0100_0111;
		mem[51]    = 12'b0010_0100_0111;
		mem[52]    = 12'b0010_0100_0111;
		mem[53]    = 12'b0010_0100_0111;
		mem[54]    = 12'b0010_0100_0111;
		mem[55]    = 12'b0010_0100_0111;
		mem[56]    = 12'b0010_0100_0111;
		mem[57]    = 12'b0010_0100_0111;
		mem[58]    = 12'b0010_0100_0111;
		mem[59]    = 12'b0010_0100_0111;
		mem[60]    = 12'b0010_0100_0111;
		mem[61]    = 12'b0010_0100_0111;
		mem[62]    = 12'b0010_0100_0111;
		mem[63]    = 12'b0010_0100_0111;
		
		mem[64]    = 12'b1000_1000_1000;
		mem[65]    = 12'b1000_1000_1000;
		mem[66]    = 12'b1000_1000_1000;
		mem[67]    = 12'b1000_1000_1000;
		mem[68]    = 12'b1000_1000_1000;
		mem[69]    = 12'b1000_1000_1000;
		
		mem[70]    = 12'b0010_0100_0111;
		mem[71]    = 12'b0010_0100_0111;
		mem[72]    = 12'b0010_0100_0111;
		mem[73]    = 12'b0010_0100_0111;
		
		mem[74]    = 12'b1000_1000_1000;
		mem[75]    = 12'b1000_1000_1000;
		mem[76]    = 12'b1000_1000_1000;
		mem[77]    = 12'b1000_1000_1000;
		mem[78]    = 12'b1000_1000_1000;
		mem[79]    = 12'b1000_1000_1000;
		mem[80]    = 12'b1000_1000_1000;
		mem[81]    = 12'b1000_1000_1000;
		mem[82]    = 12'b1000_1000_1000;
		mem[83]    = 12'b1000_1000_1000;
		mem[84]    = 12'b1000_1000_1000;
		mem[85]    = 12'b1000_1000_1000;
		
		mem[86]    = 12'b0010_0100_0111;
		mem[87]    = 12'b0010_0100_0111;
		mem[88]    = 12'b0010_0100_0111;
		mem[89]    = 12'b0010_0100_0111;
		
		mem[90]    = 12'b1000_1000_1000;
		mem[91]    = 12'b1000_1000_1000;
		mem[92]    = 12'b1000_1000_1000;
		mem[93]    = 12'b1000_1000_1000;
		mem[94]    = 12'b1000_1000_1000;
		mem[95]    = 12'b1000_1000_1000;
		mem[96]    = 12'b1000_1000_1000;
		mem[97]    = 12'b1000_1000_1000;
		mem[98]    = 12'b1000_1000_1000;
		mem[99]    = 12'b1000_1000_1000;
		mem[100]    = 12'b1000_1000_1000;
		mem[101]    = 12'b1000_1000_1000;
		
		mem[102]    = 12'b0010_0100_0111;
		mem[103]    = 12'b0010_0100_0111;
		mem[104]    = 12'b0010_0100_0111;
		mem[105]    = 12'b0010_0100_0111;
		
		mem[106]    = 12'b1000_1000_1000;
		mem[107]    = 12'b1000_1000_1000;
		mem[108]    = 12'b1000_1000_1000;
		mem[109]    = 12'b1000_1000_1000;
		mem[110]    = 12'b1000_1000_1000;
		mem[111]    = 12'b1000_1000_1000;
		mem[112]    = 12'b1000_1000_1000;
		mem[113]    = 12'b1000_1000_1000;
		mem[114]    = 12'b1000_1000_1000;
		mem[115]    = 12'b1000_1000_1000;
		mem[116]    = 12'b1000_1000_1000;
		mem[117]    = 12'b1000_1000_1000;
		
		mem[118]    = 12'b0010_0100_0111;
		mem[119]    = 12'b0010_0100_0111;
		mem[120]    = 12'b0010_0100_0111;
		mem[121]    = 12'b0010_0100_0111;
		
		mem[122]    = 12'b1000_1000_1000;
		mem[123]    = 12'b1000_1000_1000;
		mem[124]    = 12'b1000_1000_1000;
		mem[125]    = 12'b1000_1000_1000;
		mem[126]    = 12'b1000_1000_1000;
		mem[127]    = 12'b1000_1000_1000;
		mem[128]    = 12'b1000_1000_1000;
		mem[129]    = 12'b1000_1000_1000;
		mem[130]    = 12'b1000_1000_1000;
		mem[131]    = 12'b1000_1000_1000;
		mem[132]    = 12'b1000_1000_1000;
		mem[133]    = 12'b1000_1000_1000;
		
		mem[134]    = 12'b0010_0100_0111;
		mem[135]    = 12'b0010_0100_0111;
		mem[136]    = 12'b0010_0100_0111;
		mem[137]    = 12'b0010_0100_0111;
		
		mem[138]    = 12'b1000_1000_1000;
		mem[139]    = 12'b1000_1000_1000;
		mem[140]    = 12'b1000_1000_1000;
		mem[141]    = 12'b1000_1000_1000;
		mem[142]    = 12'b1000_1000_1000;
		mem[143]    = 12'b1000_1000_1000;
		mem[144]    = 12'b1000_1000_1000;
		mem[145]    = 12'b1000_1000_1000;
		mem[146]    = 12'b1000_1000_1000;
		mem[147]    = 12'b1000_1000_1000;
		mem[148]    = 12'b1000_1000_1000;
		mem[149]    = 12'b1000_1000_1000;
		
		mem[150]    = 12'b0010_0100_0111;
		mem[151]    = 12'b0010_0100_0111;
		mem[152]    = 12'b0010_0100_0111;
		mem[153]    = 12'b0010_0100_0111;
		
		mem[154]    = 12'b1000_1000_1000;
		mem[155]    = 12'b1000_1000_1000;
		mem[156]    = 12'b1000_1000_1000;
		mem[157]    = 12'b1000_1000_1000;
		mem[158]    = 12'b1000_1000_1000;
		mem[159]    = 12'b1000_1000_1000;
		mem[160]    = 12'b1000_1000_1000;
		mem[161]    = 12'b1000_1000_1000;
		mem[162]    = 12'b1000_1000_1000;
		mem[163]    = 12'b1000_1000_1000;
		mem[164]    = 12'b1000_1000_1000;
		mem[165]    = 12'b1000_1000_1000;
		
		mem[166]    = 12'b0010_0100_0111;
		mem[167]    = 12'b0010_0100_0111;
		mem[168]    = 12'b0010_0100_0111;
		mem[169]    = 12'b0010_0100_0111;
		
		mem[170]    = 12'b1000_1000_1000;
		mem[171]    = 12'b1000_1000_1000;
		mem[172]    = 12'b1000_1000_1000;
		mem[173]    = 12'b1000_1000_1000;
		mem[174]    = 12'b1000_1000_1000;
		mem[175]    = 12'b1000_1000_1000;
		mem[176]    = 12'b1000_1000_1000;
		mem[177]    = 12'b1000_1000_1000;
		mem[178]    = 12'b1000_1000_1000;
		mem[179]    = 12'b1000_1000_1000;
		mem[180]    = 12'b1000_1000_1000;
		mem[181]    = 12'b1000_1000_1000;
		
		mem[182]    = 12'b0010_0100_0111;
		mem[183]    = 12'b0010_0100_0111;
		mem[184]    = 12'b0010_0100_0111;
		mem[185]    = 12'b0010_0100_0111;
		
		mem[186]    = 12'b1000_1000_1000;
		mem[187]    = 12'b1000_1000_1000;
		mem[188]    = 12'b1000_1000_1000;
		mem[189]    = 12'b1000_1000_1000;
		mem[190]    = 12'b1000_1000_1000;
		mem[191]    = 12'b1000_1000_1000;
		
		mem[192]    = 12'b0010_0100_0111;
		mem[193]    = 12'b0010_0100_0111;
		mem[194]    = 12'b0010_0100_0111;
		mem[195]    = 12'b0010_0100_0111;
		mem[196]    = 12'b0010_0100_0111;
		mem[197]    = 12'b0010_0100_0111;
		mem[198]    = 12'b0010_0100_0111;
		mem[199]    = 12'b0010_0100_0111;
		mem[200]    = 12'b0010_0100_0111;
		mem[201]    = 12'b0010_0100_0111;
		
		mem[202]    = 12'b1000_1000_1000;
		mem[203]    = 12'b1000_1000_1000;
		mem[204]    = 12'b1000_1000_1000;
		mem[205]    = 12'b1000_1000_1000;
		mem[206]    = 12'b1000_1000_1000;
		mem[207]    = 12'b1000_1000_1000;
		
		mem[208]    = 12'b0010_0100_0111;
		mem[209]    = 12'b0010_0100_0111;
		mem[210]    = 12'b0010_0100_0111;
		mem[211]    = 12'b0010_0100_0111;
		mem[212]    = 12'b0010_0100_0111;
		mem[213]    = 12'b0010_0100_0111;
		mem[214]    = 12'b0010_0100_0111;
		mem[215]    = 12'b0010_0100_0111;
		mem[216]    = 12'b0010_0100_0111;
		mem[217]    = 12'b0010_0100_0111;
		
		mem[218]    = 12'b1000_1000_1000;
		mem[219]    = 12'b1000_1000_1000;
		mem[220]    = 12'b1000_1000_1000;
		mem[221]    = 12'b1000_1000_1000;
		mem[222]    = 12'b1000_1000_1000;
		mem[223]    = 12'b1000_1000_1000;
		
		mem[224]    = 12'b0010_0100_0111;
		mem[225]    = 12'b0010_0100_0111;
		mem[226]    = 12'b0010_0100_0111;
		mem[227]    = 12'b0010_0100_0111;
		mem[228]    = 12'b0010_0100_0111;
		mem[229]    = 12'b0010_0100_0111;
		mem[230]    = 12'b0010_0100_0111;
		mem[231]    = 12'b0010_0100_0111;
		mem[232]    = 12'b0010_0100_0111;
		mem[233]    = 12'b0010_0100_0111;
		
		mem[234]    = 12'b1000_1000_1000;
		mem[235]    = 12'b1000_1000_1000;
		mem[236]    = 12'b1000_1000_1000;
		mem[237]    = 12'b1000_1000_1000;
		mem[238]    = 12'b1000_1000_1000;
		mem[239]    = 12'b1000_1000_1000;
		
		mem[240]    = 12'b0010_0100_0111;
		mem[241]    = 12'b0010_0100_0111;
		mem[242]    = 12'b0010_0100_0111;
		mem[243]    = 12'b0010_0100_0111;
		mem[244]    = 12'b0010_0100_0111;
		mem[245]    = 12'b0010_0100_0111;
		mem[246]    = 12'b0010_0100_0111;
		mem[247]    = 12'b0010_0100_0111;
		mem[248]    = 12'b0010_0100_0111;
		mem[249]    = 12'b0010_0100_0111;
		
		mem[250]    = 12'b1000_1000_1000;
		mem[251]    = 12'b1000_1000_1000;
		mem[252]    = 12'b1000_1000_1000;
		mem[253]    = 12'b1000_1000_1000;
		mem[254]    = 12'b1000_1000_1000;
		mem[255]    = 12'b1000_1000_1000;
	end
	
	always @(posedge clock) begin
		data_out <= mem[address]; //read
	end

endmodule 