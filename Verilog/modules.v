module sixteenbitmultiplier(input[25:0] p,q,output[25:0] n);

   assign n = p*q;

endmodule

module keyGenerator(input clk,input[25:0] phi,output[25:0] e,d);	
	reg[25:0] i,p;
	initial begin
		i=26'd2;
		p=26'd24;
		while(p%i==0)begin
			i=i+26'd1;
		end
	end
	assign e=i;
	assign d=(phi+26'd1)/i;

endmodule

module encryptor(input[25:0] e,n,letter, output[25:0] en_letter);

    assign en_letter = (letter**e)%n;

endmodule

module decryptor(input[25:0] d,n,en_letter,letter, output[25:0] de_letter);

    assign de_letter = (en_letter**d)%n;

endmodule





