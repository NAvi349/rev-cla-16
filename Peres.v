module Peres(
	output P,
	output Q,
	output R,
	input A,
	input B,
	input C
		
);

	assign P = A;
	assign Q = A ^ B;
	assign R = (A & B) ^ C;
 	
endmodule
