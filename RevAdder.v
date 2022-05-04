module RevAdder(Sum, Cout, A, B, Cin, Aout, Bout, Cinv);
	input [3:0] A, B;
	input Cin;
	output [3:0] Sum;
	output Cout;
	output [3:0] Aout, Bout; 
	output Cinv;
	 
	wire [3:0] p,g, pc;
	wire [4:0] c;
	
	//assign p=a^b; //propagate
	//assign g=a&b; 
	wire [3:0] pg;
	genvar i;	
	generate 
		for (i = 0; i < 4; i = i + 1) 
			begin : pg_loop 
				Peres pg_i(.P(pg[i]), .Q(p[i]), .R(g[i]), .A(A[i]), .B(B[i]), .C(0));
			end
	endgenerate
		
	

	//c[i+1] =gi | pi & ci	
	 
	assign c[0] = Cin;
	wire [3:0] pcq, pcr, prq, prr;
	
	genvar j;
		generate 
		for (j = 0; j < 4; j = j + 1)
			begin : c_loop
				//AND_Fred AND1 (pc[j], p[j], c[j]);
				//OR_Fred OR1 (c[j+1], g[j], pc[j]);
				Fredkin AND1 (.P(pc[j]), .Q(prq[j]), .R(prr[j]), .A(p[j]), .B(0), .C(c[j]));
				Fredkin OR1 (.P(c[j+1]), .Q(pcq[j]), .R(pcr[j]), .A(1), .B(g[j]), .C(pc[j]));
			end
	endgenerate
	
	assign Cout = c[4];
	
	//sum=p^c;
	
	wire [3:0] pout, pinv, sumr, cinv;
	//wire thrinv;
	
	generate 
		for (i = 0; i < 4; i = i + 1)
			begin : s_loop
				Peres sum_i(.P(pout[i]), .Q(Sum[i]), .R(sumr[i]), .A(p[i]), .B(c[i]), .C(0));
			end
	endgenerate
	
	generate 
		for (i = 0; i < 4; i = i + 1)
			begin : s_loop_inv
				Peres sum_inv_i(.P(pinv[i]), .Q(cinv[i]), .A(pout[i]), .B(Sum[i]), .R(sumr[i]));
			end
	endgenerate

	// carry CLA Inverse
	wire [3:0] fir_inv, sec_inv;
	wire [3:0] g_inv, pc_inv, p_inv;  
	wire [4:0] c_inv;
	
	generate 
		for (j = 0; j < 4; j = j + 1)
			begin : c_loop_inv
				//AND_Fred AND1 (pc[j], p[j], c[j]);
				//OR_Fred OR1 (c[j+1], g[j], pc[j]);
				Fredkin OR1_inv (.P(fir_inv[j]), .Q(g_inv[j]), .R(pc_inv[j]), .A(c[j+1]), .B(pcq[j]), .C(pcr[j]));
				Fredkin AND1_inv (.P(p_inv[j]), .Q(sec_inv[j]), .R(c_inv[j]), .A(pc_inv[j]), .B(prq[j]), .C(prr[j]));

			end
	endgenerate
	

	assign Cinv = c_inv[0];
	wire [3:0] ph_th;
	generate 
		for (i = 0; i < 4; i = i + 1) 
			begin : pg_loop_inv 
				Peres pg__i_inv(.P(Aout[i]), .Q(Bout[i]), .R(ph_th[i]), .A(pg[i]), .B(p_inv[i]), .C(g_inv[i]));
			end
	endgenerate
	
	
endmodule
