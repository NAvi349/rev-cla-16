module RevAdd16 (Sum, Cout, A, B, Cin, Aout, Bout, Cinv);
	input [15:0] A, B;
	output [15:0] Sum;
	input Cin;
	output Cout, Cinv;
	output [15:0] Aout, Bout;
	wire c[3:1], c_inv[3:1];
	
	//Adder A0 (Sum[3:0], c[1], A[3:0], B[3:0], Cin);
	//Adder A1 (Sum[7:4], c[2], A[7:4], B[7:4], c[1]);
	//Adder A2 (Sum[11:8], c[3], A[11:8], B[11:8], c[2]);
	//Adder A3 (Sum[15:12], Cout, A[15:12], B[15:12], c[3]);
	
	RevAdder A0(Sum[3:0], c[1], A[3:0], B[3:0], Cin, Aout[3:0], Bout[3:0], Cinv);
	

	RevAdder A1(Sum[7:4], c[2], A[7:4], B[7:4], c[1], Aout[7:4], Bout[7:4], c_inv[1]);
	

	RevAdder A2(Sum[11:8], c[3], A[11:8], B[11:8], c[2], Aout[11:8], Bout[11:8], c_inv[2]);
	

	RevAdder A3(Sum[15:12], Cout, A[15:12], B[15:12], c[3], Aout[15:12], Bout[15:12], c_inv[3]);
	

endmodule
