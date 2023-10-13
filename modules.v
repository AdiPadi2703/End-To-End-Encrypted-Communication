module sixteenbitmultiplier(input[24:0] p,q,output[24:0] n);

   assign n = p*q;

endmodule

module encryptor(input[24:0] e,n,letter, output[24:0] en_letter);

    assign en_letter = (letter**e)%n;

endmodule

module decryptor(input[24:0] d,n,en_letter,letter, output[24:0] de_letter);

    assign de_letter = (en_letter**d)%n;

endmodule





