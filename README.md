# End-To-End-Encrypted-Communication

<details>
  <summary>Team Details</summary>
  <br>
  Semester: 3rd Semester B.Tech CSE
  <br>
  Section: S1
  <br>
  Member 1: Adithya S Ubaradka, 221CS105, adithyau.221cs105@nitk.edu.in
  <br>
  Member 2: Akshat Mishra
  <br>
  Member 3: Hemang J Jamadagni, 221CS129,hemangj.221cs129@nitk.edu.in
</details>

<details>
  <summary>Abstract</summary>
  <br>
  The process of encoding information, which is conversion of the original representation of the information 
  known as ‘plain text’, into an alternative form known as ‘cipher text’ is called encryption.
  Encryption does not itself prevent interference but denies the intelligible content to a would-be interceptor.
  <br>
  <br>
  Problem Statement:
  <br>
  <br>
  The goal of this project is to design a system of units that communicate between each other via end-to-end encryption. The RSA            encryption algorithm will be used and the user will be able to choose the kind of encryption. The aim is to achieve secure                communication between two digital systems.
</details>

<details>
  <summary>Working</summary>
  <br>
  Functional Table:
  <br>
  <br>
  <img src = https://github.com/AdiPadi2703/End-To-End-Encrypted-Communication/blob/main/Screenshots/Functional%20Table.png>
</details>

<details>
  <summary>Logisim Circuit Diagram</summary>
  <br>
  Main Diagram:
  <br>
  <br>
  <img src = Screenshots/ModulatedCircuit.png>
  <br>
  <br>
  <br>
  Key Generator:
  <br>
  <br>
  <img src = Screenshots/KeyGen.png>
  <br>
  <br>
  <br>
  Encrypter:
  <br>
  <br>
  <img src = Screenshots/Encrypter.png>
  <br>
  <br>
  <br>
  Decrypter:
  <br>
  <br>
  <img src = Screenshots/Decrypter.png>
  
</details>

<details>
  <summary>Verilog Code</summary>
  
```Verilog
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
```
<br>

```Verilog
module testbench;

    reg [25:0] p;
    reg [25:0] q;
    reg [25:0] p_;
    reg [25:0] q_;
    reg [25:0] letter;
    reg clk;
    wire [25:0] n;
    wire [25:0] e;
    wire [25:0] d;
    wire [25:0] phi;
    wire [25:0] en_letter;
   wire [25:0] de_letter;

    sixteenbitmultiplier m1(p,q,n);
    sixteenbitmultiplier m2(p-26'd1,q-26'd1,phi);
    keyGenerator kg(clk,phi,e,d);
    encryptor en(e,n,letter,en_letter);
    decryptor de(d,n,en_letter,letter,de_letter);

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0);
    end

    initial begin
       p =26'd5;
       q =26'd7;
       $display("Input letter number (a = 0)      Encrypted text      Decrypted text");
       $display("-------------------------------------------------------------------");
       for(letter =26'd0;letter <26'd26;letter = letter +26'd1)begin
            $display("        %d               %d               %d",letter,en_letter,de_letter);
       end
    end

    initial #400 $finish;
endmodule
```

</details>

#Video Implementation
	[rsaImplementation.webm](https://github.com/AdiPadi2703/End-To-End-Encrypted-Communication/assets/120291477/ab7bfe78-d34e-4a2c-9249-af93827ed2c1)
