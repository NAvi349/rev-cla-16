module Fredkin(
	output P,
	output Q,
	output R,
	input A,
	input B,
	input C
		
);

	assign P = (A & C) | (B & ~C);
	assign Q = (A & ~C) | (B & C);
	assign R = C;
 	
endmodule

