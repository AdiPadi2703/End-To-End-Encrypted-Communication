module key(input[12:0]  p,q , output[12:0] n,e,d);
	integer i,j;
	assign n = p*q;
	initial begin
		i=3;
		while(((p-1)*(q-1))%i==0)begin
			i=i+1;#10;
			end
	end
	assign e = i;
	assign d = (2*(p-1)*(q-1)+1)/i;
endmodule

/*
module test;
	reg[12:0] a,b;
	wire[12:0] n,d,e;
	key k(a,b,n,e,d);
	initial begin
		a<=53;
		b<=59;
		#10;$display("%d %d %d",n,e,d);
	end
endmodule
*/
