module Timer(i_clk, i_up, i_down,o_seg_dec, i_set, o_seg); //Programmable timer

parameter DIV_CONST = 50_000_000; //Clock division ratio

wire         div;          //i_up, i_down and i_set is buttons
wire         pos_up;
wire         pos_down;
wire         pos_set;
wire         tick_1hz;
input        i_clk;
input        i_up;
input        i_down;
input        i_set;
output [6:0] o_seg_dec;    //Output for bare 7 digit indicator 
output  reg [3:0]   o_seg; //Output for external indicator w\ decoder


reg rst_s;


counter #(.MAX_VAL(DIV_CONST-1), .WIDTH(26) ) freq_div( .i_clk    (i_clk),     //Creating 1Hz tick and square signal 
                                                        .i_rst_n  (i_set), 
                                                        .o_tick   (tick_1hz),
																		  .o_div    (div)
                                                       );
posedge_det posset (.i_clk(i_clk),		//Creating signal to confirm wheather a button was pushed																 
						.sig_in(i_set),
                  .sig_out(pos_set));
						
						
posedge_det posup (.i_clk(i_clk),																		 
						.sig_in(i_up),
                  .sig_out(pos_up));

posedge_det posdown (.i_clk(i_clk),																		 
						.sig_in(i_down),
                  .sig_out(pos_down));						
						
always @(posedge i_clk) begin //Input i_set has two different positions and defines with rst_s variable: 
  if (rst_s == 1'b1) begin    // Ready for setting timer(rst_s ==1'b1) and In setting procedure(rst_s ==1'b0)
      o_seg <= 4'h0;
      rst_s <= 1'b0;
		if (pos_up) begin
		o_seg <= o_seg + 4'h1;  //Timer setting
		end
		if (pos_down) begin
		o_seg <= o_seg - 4'h1;
		end
	end
  else if (rst_s == 1'b0) begin
      rst_s <= 1'b1;
		if (o_seg > 0) begin
			if (tick_1hz) begin
			o_seg <= o_seg - 1'h1;
			end
		end else begin
			if (div) begin      //If value of timer becomes zero, indicator blinks with half a second on and half a second off time(at this parameters) 
			o_seg <= 4'hA;
			end else begin
			o_seg <= 4'h0;
			end
		end 	
  end
 end
  
dec_7seg    dec_sec_0(.i_dat (o_seg),   //Goes to an decoding module
                      .o_seg (o_seg_dec)
                      );  
endmodule
