module full_adder(
    input a,
    input b,
    input ci,
    output s,
    output co);

    assign s = a^b^ci;
    assign co = (a&&b || ci&&(a^b));

endmodule

module full_subtractor(
    input a,
    input b,
    input bi,
    output d,
    output bo);

    assign d = a^b^bi;
    assign bo = (!a&&b || bi&&(!a||b));

endmodule

module fourbitmultiplier(
    input a0,
    input a1,
    input a2,
    input a3,
    input b0,
    input b1,
    input b2,
    input b3,
    output p0,
    output p1,
    output p2,
    output p3,
    output p4,
    output p5,
    output p6,
    output p7);

    wire k[0:3];
    wire c[0:5];
    wire d[0:3];

    assign p7 = a3&&b3;

    full_adder f1(a2&&b3,a3&&b2,1'b0,p6,c[5]);

    full_adder f2(a1&&b3,a2&&b2,c[5],k[3],d[3]);
    full_adder f3(a3&&b1,k[3],d[3],p5,c[4]);

    full_adder f4(a0&&b3,a1&&b2,c[4],k[2],d[2]);
    full_adder f5(a2&&b1,k[2],d[2],k[1],d[1]);
    full_adder f6(a3&&b0,d[1],k[1],p4,c[3]);


    full_adder f7(a0&&b2,a1&&b1,c[3],k[0],d[0]);
    full_adder f8(a2&&b0,k[0],d[0],p3,c[2]);

    full_adder f9(a0&&b1,a1&&b0,c[2],p2,c[1]);

    full_adder f10(a0&&b0,c[1],1'b0,p1,c[0]);

    assign p0 = c[0];

endmodule




