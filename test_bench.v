module testbench;

    reg [0:3] p;
    reg [0:3] q;
    reg [0:3] p_;
    reg [0:3] q_;
    wire [0:7] n;
    wire [0:7] phi;

    fourbitmultiplier m1(p[0],p[1],p[2],p[3],q[0],q[1],q[2],q[3],n[0],n[1],n[2],n[3],n[4],n[5],n[6],n[7]);
    fourbitmultiplier m2(p_[0],p_[1],p_[2],p_[3],q_[0],q_[1],q_[2],q_[3],phi[0],phi[1],phi[2],phi[3],phi[4],phi[5],phi[6],phi[7]);

initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0);
end

initial begin
    p = 4'b0011; //3
    q = 4'b0111; //7
    p_ = p - 4'b0001;
    q_ = q - 4'b0001;
    $display("a[0]  a[1]  a[2]  a[3]    b[0]  b[1]  b[2]  b[3]   p[0]  p[1]  p[2]  p[3]  p[4]  p[5]  p[6]  p[7]");
    $monitor(" %b   %b    %b     %b      %b    %b    %b    %b    %b     %b    %b    %b    %b    %b    %b    %b  ",p[0],p[1],p[2],p[3],q[0],q[1],q[2],q[3],n[0],n[1],n[2],n[3],n[4],n[5],n[6],n[7]);
    #10
    $monitor(" %b   %b    %b     %b      %b    %b    %b    %b    %b     %b    %b    %b    %b    %b    %b    %b  ",p_[0],p_[1],p_[2],p_[3],p_[0],q_[1],q_[2],q_[3],phi[0],phi[1],phi[2],phi[3],phi[4],phi[5],phi[6],phi[7]);

end

initial #400 $finish;

endmodule
