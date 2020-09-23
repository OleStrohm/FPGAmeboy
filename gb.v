module gb(
	input clk
);

	logic toggled /*verilator public*/;

	initial toggled = 1'b0;

	always @ (posedge clk) begin
		toggled <= !toggled;
	end

endmodule
