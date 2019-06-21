module posedge_det (i_clk, sig_in, sig_out);
input i_clk;
input sig_in;
output sig_out;

reg sig_reg;

always @(posedge i_clk) begin
sig_reg <= sig_in;
end

assign sig_out = ~sig_in & sig_reg;

endmodule 