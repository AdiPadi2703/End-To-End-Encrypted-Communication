module testbench;

    reg [24:0] p;
    reg [24:0] q;
    reg [24:0] p_;
    reg [24:0] q_;
    reg [24:0] letter;
    wire [24:0] n;
    reg [24:0] e;
    reg [24:0] d;
    wire [24:0] phi;
    wire [24:0] en_letter;
    wire [24:0] de_letter;

    sixteenbitmultiplier m1(p,q,n);
    sixteenbitmultiplier m2(p-24'd1,q-24'd1,phi);
    encryptor en(e,n,letter,en_letter);
    decryptor de(d,n,en_letter,letter,de_letter);

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0);
    end

    initial begin
       p =24'd3;
       q =24'd7;
       e =24'd5;
       d =24'd5;
       $display("Input letter number (a = 1)      Decrypted after encryption");
       $display("-----------------------------------------------------------");
       for(letter =24'd1;letter <24'd27;letter = letter +24'd1)begin
            $display("          %d                 %d",letter,de_letter);
       end
    end

    initial #400 $finish;

endmodule