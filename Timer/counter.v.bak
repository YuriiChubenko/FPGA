module counter(i_clk, i_rst_n, o_tick, o_div);

parameter MAX_VAL = 7;
parameter WIDTH   = 4;

input               i_clk;
input               i_rst_n;
output  reg         o_div;
output  reg         o_tick;

reg     [WIDTH-1:0] cnt;

wire    cnt_overflow = (MAX_VAL == cnt);
wire    duty_cnt_trigger = (cnt >= MAX_VAL/2);

always @(posedge i_clk, negedge i_rst_n) begin
    if(~i_rst_n) begin
        o_tick <= 1'b0;
    end else begin
        if (cnt_overflow)
            o_tick <= 1'b1;
        else
            o_tick <= 1'b0;
    end
end

always @(posedge i_clk, negedge i_rst_n) begin
    if(~i_rst_n) begin
        cnt <= 0;
    end else begin
        if (cnt_overflow) begin
            cnt <= 0;
        end else begin
            cnt <= cnt + 1'b1;
        end
	 end  
end

always @(posedge i_clk) begin
	 if (duty_cnt_trigger) begin
	 o_div <= 1'b1;
	 end else begin
	 o_div <= 1'b0;
	 end
end	 

endmodule

