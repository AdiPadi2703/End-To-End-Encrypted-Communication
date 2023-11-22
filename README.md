# End-To-End Encrypted Communication
## Team Details
<details>
  <summary>details</summary>
  <br>
  Semester: 3rd Semester B.Tech CSE
  <br>
  Section: S1
  <br>
  Member 1: Adithya S Ubaradka, 221CS105, adithyau.221cs105@nitk.edu.in
  <br>
  Member 2: Akshat Mishra, 221CS107, akshatmishra.221cs107@nitk.edu.in
  <br>
  Member 3: Hemang J Jamadagni, 221CS129, hemangj.221cs129@nitk.edu.in
</details>

## Abstract
<details>
  <summary>details</summary>
  <br>
  The process of encoding information, which is conversion of the original representation of the information 
  known as ‘plain text’, into an alternative form known as ‘cipher text’ is called encryption.
  Encryption does not itself prevent interference but denies the intelligible content to a would-be interceptor.
  <br>
  <br>
  <b>Problem Statement:</b>
  <br>
  <br>
  The goal of this project is to design a system of units that communicate between each other via end-to-end encryption. The RSA            encryption algorithm will be used and the user will be able to choose the kind of encryption. The aim is to achieve secure                communication between two digital systems.
<br>
<br>
Here's how the RSA algorithm works:
<br><br>
<b>Key Generation:</b>
<br><br>
RSA uses a pair of keys: a public key and a private key. These keys are generated as follows:
Choose two distinct prime numbers, typically denoted as p and q.
Compute the product of these two prime numbers:
The value of n is used as the modulus for both the public and private keys.
Calculate Euler's totient function, φ(n) = (p-1)(q-1).
Select a public exponent (e) such that 1 < e < φ(n), and e is coprime to φ(n), which means they have no common factors other than 1. For ease of arbitration, we have chosen to use the smallest number coprime to φ(n) for any given n.
Calculate a private exponent (d) such that (d * e) % φ(n) = 1. In other words, d is the modular multiplicative inverse of e modulo φ(n). The formula we have chosen for d is d = (k * φ(n) + 1) / e,  for some integer k where d is a whole number.

The public key consists of (n, e), and the private key consists of d.
<br><br>
<b>Encryption:</b>

To send an encrypted message, the sender uses the recipient's public key.
The message is represented as an integer, usually by breaking it into blocks and converting those blocks to numbers.
The sender then computes the ciphertext (C) using the recipient's public key: C = (M^e) mod n, where M is the plaintext message.
<br><br>
<b>Decryption:</b><br>

The recipient uses their private key to decrypt the ciphertext.
The recipient computes the plaintext message (M) using the private key: M = (C^d) mod n.

The security of the RSA algorithm is based on the difficulty of factoring the large composite number n into its prime factors (p and q). As long as n is sufficiently large and its prime factors remain unknown, RSA encryption is considered secure. The security relies on the mathematical properties of prime factorization, which is computationally intensive for large integers.
<br><br>
Implementation of the project:
In the project, the implementation of this algorithm was done similarly, by dividing the circuit according to the three phases into the Key Generation module, the Encryption module and the Decryption module. 

In our chosen design, the Key Generation module will allow any user to choose the value of n and e by adding any two prime numbers they wish, and the output will be the both of the public key’s parts, n and e. The generated private key (d) will be directly fed to the Decryption module, while the public key will be shown to the user on a seven segment display to input into the next module. 
<br>

Going to the Encryption module, here the user is asked to enter their message of choice and their public key (n,e), which the encryption module turns into the cipher text (C), which is both displayed and fed to the Decryption module.
<br>
The Decryption module performs the process of converting ciphertext (C) into the message again, using the private key (d) as input from the Key Generation module and the ciphertext as input from the Encryption module. The message is then displayed as the output of the module to show the success of the decryption.
<br><br>

<b>Why this project?:</b><br><br>
WIth the advancement of technology, security of information and data has become extremely relevant. Encryption is a way of manipulating the appearance of data and information to ensure such security from third parties. Depending on the methods of encryption, either the receiver, sender or both will be able to make sense out of encrypted data.
Cryptography has become a major area of research. This project was chosen keeping in mind its current importance and relevance.
End-To-End Encryption is widely used in instant messaging applications like Whatsapp.
</details>

## Working
<details>
  <summary>details</summary>
  <br>
  Functional Table:
  <br>
  <br>
  <img src = https://github.com/AdiPadi2703/End-To-End-Encrypted-Communication/blob/main/Screenshots/Functional%20Table.png>
</details>

## Logisim Circuit diagram 
<details>
  <summary>details</summary>
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

## Verilog Code
<details>
  <summary>details</summary>
  
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

## Videos
<details>
	<summary>details</summary>
	
Logisim Implementation Video:
<br>


https://github.com/AdiPadi2703/End-To-End-Encrypted-Communication/assets/120291477/a5b53006-85e1-4fbc-9b32-428c0ae0e10f



<br>
<br>
Hardware Implementation Video:
<br>


https://github.com/AdiPadi2703/End-To-End-Encrypted-Communication/assets/120291477/e58efb54-a5ea-445c-9ed3-0294063be95c


<br><br>

Notes for the Hardware Implementation video:<br><br>In the video, the first switch represents "Enable Decrypt" and not "Load Decrypt" which was incorrectly mentioned.<br><br>It should also be noted that since the public key is 15, 0%15 and 1%15 remain 0 and 1. This is the second part of the reason for why 0 and 1 remain the same during encryption and decryption, which wasn't mentioned in the video.<br><br>The clock in the video was connected to 10Hz and not 15Hz.<br><br>


</details>
